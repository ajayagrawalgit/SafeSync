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
