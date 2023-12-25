function log_this() {
    local log_file=$(cat "$(dirname "$0")/config/config.json" | grep log_destination | tr -d \" | awk '{print $2}' | tr -d ,)
    # Read from standard input and log to the specified file
    while IFS= read -r line; do
        echo "$line" >> "$log_file"
    done
}

function log_this_to_rsync() {
    local log_file=$(cat "$(dirname "$0")/config/config.json" | grep rsync_log | tr -d \" | awk '{print $2}' | tr -d ,)
    # Read from standard input and log to the specified file
    echo -e "[ $(date) ] - rsync logging started now." >> $log_file
    while IFS= read -r line; do
        echo "$line" >> "$log_file"
    done
    echo -e "[ $(date) ] - rsync logging stopped now." >> $log_file
    echo -e "\n" >> $log_file
}

function check_empty_variables() {
    local empty_variables=()

    # Check Log Destination - Exit if Log not Found ...
    if [ -z "$log_destination" ]; then
        echo -e "[ $(date) ] - ( !!! HARD STOP ERROR !!! ) : log_destination not specified in config.json. Exiting !"
        exit 1
    fi

    # Check is Backup List is Empty and Exit if true ...
    if [ "$(cat "$backup_list" | tr -d '[:space:]')" = "" ]; then
        echo -e "[ $(date) ] - ( !!! HARD STOP ERROR !!! ) : Backup List ($backup_list) is empty. Exiting !"
        exit 1
    fi

    # Check Backup Interval
    if [ -z "$backup_interval" ]; then
        empty_variables+=("backup_interval")
    fi

    # Check Exceptions
    if [ ${#exceptions[@]} -eq 0 ]; then
        empty_variables+=("exceptions")
    fi

    # Check Create Directories
    if [ -z "$create_dirs" ]; then
        empty_variables+=("create_dirs")
    fi

    # Check Log Destination
    if [ -z "$log_destination" ]; then
        empty_variables+=("log_destination")
    fi

    # Display empty variable names, if any
    if [ ${#empty_variables[@]} -gt 0 ]; then
        echo "[ $(date) ] - (!!! WARNING !!!) : Empty Variables Detected in config.json - ${empty_variables[@]}" | log_this
    fi
}


path_exists() {
    local path_to_check="$1"
    if [ -e "$path_to_check" ]; then
        echo "[ $(date) ] - ( INFO ) : $path_to_check is a Valid Path ✓" | log_this
    else
        echo "[ $(date) ] - ( WARNING ) : $path_to_check is an Invalid Path ✗" | log_this
    fi
}



function secure_backup() {
    local source_path="$1"
    local destination_path="$2"
    local secure_backup_interval="$3"

    if [ -d "$source_path" ]; then
        local current_time=$(date +%s)

        # Determine the appropriate stat command based on the platform
        local stat_command="stat"
        if [[ "$(uname)" == "Darwin" ]]; then
            stat_command="stat -f %m"
        fi

        # Iterate over all files in the source directory
        for source_file in "$source_path"/*; do
            if [ -f "$source_file" ]; then
                local file_name=$(basename "$source_file")
                local destination_file="$destination_path/$file_name"

                if [ -e "$destination_file" ]; then
                    local source_mod_time=$($stat_command "$source_file")
                    local time_difference=$((current_time - source_mod_time))

                    # Compare modification time, if the file was modified within the secure_backup_interval
                    if [ "$time_difference" -ge "$secure_backup_interval" ]; then
                        local dest_mod_time=$($stat_command "$destination_file")

                        # If the source file has been modified since the last secure_backup_interval
                        if [ "$source_mod_time" -gt "$dest_mod_time" ]; then
                            local timestamp=$(date +"%Y%m%d%H%M%S")
                            local secure_backup_name="${file_name}_safesync_secure_bkp_${timestamp}"

                            local secure_backup_destination="$destination_path/$secure_backup_name"
                            mv "$destination_file" "$secure_backup_destination"
                            echo -e "[ $(date) ] - ( INFO ) : Secure Backup Taken. Renamed: $file_name -> $secure_backup_name" | log_this
                        fi
                    fi
                fi
            fi
        done
    fi
}

