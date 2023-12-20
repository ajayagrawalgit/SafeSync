#!/bin/bash

source $(dirname "$0")/src/essentials.sh


echo -e "[ $(date) ] - ( INFO ) : SafeSync Started Now" | log_this

python_command=$(cat "$(dirname "$0")/config/config.json" | grep python_command | tr -d \" | awk '{print $2}' | tr -d ,)
python_output=$($python_command src/load_json_config.py)


# Get the Python Output into Bash Variables
eval "$python_output"

# Check if any variables are empty in config.json
check_empty_variables; # from essentials.sh


# And if backup_list.txt is present, get inside this if else for the copy.
function safesync_logic() {
    echo -e "[ $(date) ] - ( INFO ) : SafeSync Triggered Now" | log_this
    if [ -e "$backup_list" ]; then
        while IFS= read -r line || [ -n "$line" ]; do
            source_path=$(echo -e "$line" | awk '{print $1}')
            destination_path=$(echo -e "$line" | awk '{print $2}')

            path_exists "$source_path"              # Just for Logging
            path_exists "$destination_path"         # Just for Logging

            # Backup rsync Logic here
            rsync_options=("-av" "--recursive")
            for exception in "${exceptions[@]}"; do
                exception="${exception//,/}"
                rsync_options+=("--exclude=*${exception}")
            done

            # Run rsync now
            echo -e "[ $(date) ] - ( INFO ) : Starting rsync now and logging the rsync output in $rsync_log" | log_this

            # Determine whether to create destination directories
            if [ "$create_dirs" = true ]; then
                # Create the destination directory, including parent directories if necessary
                echo -e "[ $(date) ] - ( INFO ) : create_dirs=true. Hence, Creating $destination_path with Parent Directories as required." | log_this
                mkdir -p "$destination_path"
                rsync_output=$(rsync "${rsync_options[@]}" "$source_path" "$destination_path" 2>&1)
            else
                echo -e "[ $(date) ] - ( INFO ) : create_dirs=false. Hence, Not creating $destination_path with any additional directories." | log_this
                rsync_output=$(rsync "${rsync_options[@]}" "$source_path/" "$destination_path" 2>&1)
            fi

            echo -e "$rsync_output" | log_this_to_rsync

            # Check the exit status of rsync
            rsync_exit_status=$?
            echo -e "[ $(date) ] - ( INFO ) : Completed rsync with Status Code:$rsync_exit_status. Complete log here -> $rsync_log" | log_this

            # Print status messages and log the result
            if [ $rsync_exit_status -eq 0 ]; then
                echo -e "[ $(date) ] - ( SUCCESS ) - SafeSync Completed Successfully for $source_path -> $destination_path. Check $rsync_log for complete file details." | log_this
            else
                echo -e "[ $(date) ] - ( FAILURE ) - SafeSync Failed for $source_path -> $destination_path. Check $rsync_log for complete file details." | log_this
            fi
        done < "$backup_list"
    else
        echo -e "[ $(date) ] - ( !!! HARD STOP ERROR !!! ) : Backup List ($backup_list) not found. Exiting !";
        exit 1;
    fi

    echo -e "[ $(date) ] - ( INFO ) : SafeSync Completed\n" | log_this
}



# Just an Infinite loop to trigger every backup_interval seconds
function safesync_loop() {
while true; do
    safesync_logic;
    sleep $backup_interval;
done
}


safesync_loop &