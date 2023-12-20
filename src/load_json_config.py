import json
import os

# Get the absolute path to the directory containing this script
script_directory = os.path.dirname(os.path.abspath(__file__))

# Build the absolute path to config.json in the config directory
config_path = os.path.join(script_directory, '..', 'config', 'config.json')

# Read configuration from config.json
with open(config_path) as f:
    config_data = json.load(f)

backup_interval = config_data['backup_interval']
backup_list = config_data['backup_list']
exceptions = config_data['exceptions']
create_dirs = config_data['create_dirs']
log_destination = config_data['log_destination']
python_command = config_data['python_command']
rsync_log = config_data['rsync_log']


# Print variables in a format suitable for Bash
print(f"backup_interval={backup_interval}")
print(f"backup_list={backup_list}")
print(f"exceptions=({', '.join(exceptions)})")
print(f"create_dirs={create_dirs}")
print(f"log_destination={log_destination}")
print(f"python_command={python_command}")
print(f"rsync_log={rsync_log}")
