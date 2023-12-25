

<a  href="https://www.buymeacoffee.com/ajayagrawal">![safesync](https://github.com/ajayagrawalgit/SafeSync/assets/94609372/2667b8ae-72f8-42cd-8adf-7bb90af30a72)</a>

<p align="center">
<a href="https://github.com/ajayagrawalgit/SafeSync/blob/main/LICENSE" title="License">
<img src="https://img.shields.io/github/license/ajayagrawalgit/SafeSync?label=License&logo=Github&style=flat-square" alt="SafeSync License"/>
</a>
<a href="https://github.com/ajayagrawalgit/SafeSync/fork" title="Forks">
<img src="https://img.shields.io/github/forks/ajayagrawalgit/SafeSync?label=Forks&logo=Github&style=flat-square" alt="SafeSync Forks"/>
</a>
<a href="https://github.com/ajayagrawalgit/SafeSync/stargazers" title="Stars">
<img src="https://img.shields.io/github/stars/ajayagrawalgit/SafeSync?label=Stars&logo=Github&style=flat-square" alt="SafeSync Stars"/>
</a>
<a href="https://github.com/ajayagrawalgit/SafeSync/issues" title="Issues">
<img src="https://img.shields.io/github/issues/ajayagrawalgit/SafeSync?label=Issues&logo=Github&style=flat-square" alt="SafeSync Issues"/>
</a>
<a href="https://github.com/ajayagrawalgit/SafeSync/pulls" title="Pull Requests">
<img src="https://img.shields.io/github/issues-pr/ajayagrawalgit/SafeSync?label=Pull%20Requests&logo=Github&style=flat-square" alt="SafeSync Pull Requests"/>
</a>
<a href="https://github.com/ajayagrawalgit/SafeSync" title="Repo Size">
<img src="https://img.shields.io/github/repo-size/ajayagrawalgit/SafeSync?label=Repo%20Size&logo=Github&style=flat-square" alt="SafeSync Repo Size"/>
</a>


SafeSync is a robust and versatile backup script meticulously engineered to synchronize files and directories seamlessly between user-specified source and destination paths within the filesystem. Offering unparalleled flexibility, this tool ensures a user-friendly experience with its configuration driven by the config.json file. Users can effortlessly tailor their backup strategy by adjusting parameters such as backup intervals, exception files, and more. SafeSync's strength lies in its ability to provide comprehensive logging and exception handling, ensuring a reliable and efficient backup process. Specially designed not only for personal machines but also for professional-grade servers, SafeSync is the go-to tool for users seeking a dependable and customizable backup solution. Whether you are a casual user in need of a straightforward backup or a power user seeking a seamless and automated approach to data synchronization, SafeSync stands as the ultimate choice. Experience the convenience of file synchronization with SafeSync—your comprehensive solution for a seamless and personalized backup strategy.

### Key Features:

1. **Flexibility:**
   - SafeSync offers flexibility in defining source and destination paths, enabling users to tailor their backup configurations according to their specific needs.

2. **User-Friendly Configuration:**
   - The tool utilizes a straightforward `config.json` file for configuration, making it easy for users to customize settings such as backup intervals, exception files, and more.

3. **Logging and Exception Handling:**
   - SafeSync includes detailed logging functionality, recording both general logs and `rsync` operation details. It also provides the option to exclude specific file types during synchronization.

4. **Automated Synchronization:**
   - With the ability to schedule backups at defined intervals, SafeSync automates the synchronization process, ensuring regular updates and minimizing the risk of data loss.

5. **Comprehensive Documentation:**
   - The project comes with a detailed README.md file, guiding users through the installation process, configuration steps, and providing insights into the directory structure and file descriptions.

### Use Cases:

- **Regular Data Backups:**
  - SafeSync is ideal for users who need a simple and efficient way to perform regular backups of their important files and directories.

- **Customized Backup Strategies:**
  - Users with specific requirements for backup intervals, file exclusions, and directory creation preferences can easily customize SafeSync to suit their needs.

- **Automated Synchronization:**
  - SafeSync's automated synchronization feature is beneficial for users who want a hands-free approach to keeping their data up-to-date.

### Why SafeSync?

SafeSync stands out as a reliable and user-friendly solution for users seeking a backup tool with flexibility, automation, and detailed logging capabilities. Whether you're a casual user looking for an easy way to safeguard your files or a power user with specific backup requirements for your servers, SafeSync provides a versatile and efficient solution.


<br>


## Directory Structure and File Details

```
└── SafeSync
    ├── LICENSE
    ├── README.md
    ├── config
    │   ├── backup_list.txt
    │   └── config.json
    ├── logs
    │   ├── rsync.log
    │   └── safesync.log
    ├── safesync.sh
    └── src
        ├── essentials.sh
        └── load_json_config.py
```

## File Descriptions

1. **LICENSE:** Contains the licensing information for the SafeSync tool.

2. **README.md:** The primary documentation file providing detailed information about the SafeSync tool, its configuration, and usage.

3. **config:**
   - **backup_list.txt:** A crucial file specifying the source and destination paths for synchronization.
   - **config.json:** Configuration file containing various settings for SafeSync, such as backup interval, exceptions, and more.

4. **logs:**
   - **rsync.log:** Log file recording details of the `rsync` operation.
   - **safesync.log:** Log file capturing general logs from the SafeSync tool.

5. **safesync.sh:** The main script file responsible for executing the SafeSync tool.

6. **src:**
   - **essentials.sh:** Script file containing essential functions and utilities used by SafeSync.
   - **load_json_config.py:** A Python script for loading and processing the configuration from `config.json`.

<br>

## Locating Configuration Files

To find the exact path of the files needed for configuration (`backup_list.txt` and `config.json`), navigate to the `SafeSync` directory and access the `config` subdirectory. The configuration files are located there:

```bash
cd SafeSync/config
```

Now, you can view or modify the contents of `backup_list.txt` and `config.json` for customizing the SafeSync tool according to your preferences.

## Locating Log Files

If you need to access the log files generated by the SafeSync tool, follow the steps below to find the exact path to the log files:

1. **rsync.log:**
   - The `rsync.log` file records details of the `rsync` operation.
   - The path to `rsync.log` is relative to the `SafeSync` directory.
   - To access `rsync.log`, navigate to the `logs` subdirectory:
     ```bash
     cd SafeSync/logs
     ```
     You can then view or analyze the contents of `rsync.log` using your preferred text editor or viewer.

2. **safesync.log:**
   - The `safesync.log` file captures general logs from the SafeSync tool.
   - Similar to `rsync.log`, the path to `safesync.log` is relative to the `SafeSync` directory.
   - To access `safesync.log`, navigate to the `logs` subdirectory:
     ```bash
     cd SafeSync/logs
     ```
     Open `safesync.log` using your preferred text editor or viewer to review the tool's general logs.

By following these steps, you can easily locate and access the log files generated by SafeSync for monitoring and troubleshooting purposes.

<br>
<br>


## Installation and Execution Guide

## Prerequisites

1. **Bash Shell Environment:**
   Ensure that your system has a Bash shell. You can check this by running:

   ```bash
   echo $SHELL
   ```

   If the output is `/bin/bash` or similar, you have a Bash shell.

2. **Python 3:**
   SafeSync is tested on Python 3. So, if you don't have any constraints about maintaining a certain python version in your machine, you can choose to install Python3 using any method listed below. Otherwise, SafeSync should potentially work on  any version of python.

   - On Debian/Ubuntu:

     ```bash
     sudo apt-get install python3
     ```

   - On Red Hat/Fedora:

     ```bash
     sudo dnf install python3
     ```

   - On macOS:

     ```bash
     brew install python3
     ```

   - On Windows:
     Download and install Python 3 from the [official Python website](https://www.python.org/downloads/).

3. **jq (JSON Processor) - OPTIONAL:**
   SafeSync uses `jq` for JSON parsing. Install it using your package manager.

   - On Debian/Ubuntu:

     ```bash
     sudo apt-get install jq
     ```

   - On Red Hat/Fedora:

     ```bash
     sudo dnf install jq
     ```

   - On macOS:

     ```bash
     brew install jq
     ```

   - On Windows:
     Download and install `jq` from the [official jq website](https://stedolan.github.io/jq/download/).

<br>


## Installation Steps

1. **Clone the Repository:**
   Clone the SafeSync repository to your local machine.

   ```bash
   git clone https://github.com/ajayagrawalgit/SafeSync.git
   ```

<br>

2. **Navigate to the SafeSync Directory:**
   Change to the SafeSync directory.

   ```bash
   cd SafeSync
   ```

<br>

3. **Configure `config.json`:**
   Edit the `config/config.json` file to customize SafeSync for your requirements. Refer to the provided `config.json` template for guidance.

   ```json
   {
       "backup_interval": 10,
       "backup_list": "/path/to/backup_list.txt",
       "exceptions": [".xml", ".html", ".yaml"],
       "create_dirs": "true",
       "log_destination": "/path/to/logs/safesync.log",
       "rsync_log": "/path/to/logs/rsync.log",
       "python_command": "python3",
       "secure_backup_interval": 3600
   }
   ```

   - **backup_interval:**
     The interval, in seconds, at which SafeSync will execute. Adjust this value to determine how frequently the backup process runs.

   - **backup_list:**
     Specify the location where `backup_list.txt` is stored. Provide the full path after cloning or downloading the repository.

   - **exceptions:**
     Specify file extensions to exclude during synchronization. Modify the existing list as needed, adhering to the current format.

   - **create_dirs:**
     Set this to "true" to instruct SafeSync to create parent directories in the destination path mirroring the source structure. Use "false" if you only want to copy files within the existing destination without creating parent directories.

   - **log_destination:**
     Specify the location where `safesync.log` is stored. Provide the full path after cloning or downloading the repository.

   - **rsync_log:**
     Define the location for the `rsync.log` file. Provide the full path after cloning or downloading the repository.

   - **python_command:**
     Enter the command used to run Python scripts on your machine. Typically, this is
	 either `python` or `python3`. Ensure accurate representation based on your system configuration.

   - **secure_backup_interval:**
     This variable should be entered in _seconds_ which specifies that if the source file is changed within this time since the script has started running, SafeSync will rename the same file in the destination path as backup and copy the fresh file with the original name to the destination. By default, it's 3600 seconds i.e. 1 hour.
     
<br>

4. **Configure `backup_list.txt`:**

	This file dictates the source and destination paths engaged in the synchronization process. Follow the specified format when inputting paths:

	```bash
	/complete/path/to/Source/directory_1   /complete/path/where_you_want_to_backup_directory_1/ie_destination_1
	/complete/path/to/Source/directory_2   /complete/path/where_you_want_to_backup_directory_1/ie_destination_2
	/complete/path/to/Source/directory_3   /complete/path/where_you_want_to_backup_directory_1/ie_destination_3
	```

	- Paths are separated by a _tab_. 
	- The initial segment represents the source, housing the original files and folders.
	- The subsequent column, situated directly in front of the source path, designates the destination where the backup of the respective source will be stored.

<br>

5. **Run SafeSync:**
   Execute the SafeSync script to initiate the backup process.

   ```bash
   ./safesync.sh
   ```

   This script reads the `config.json` file, performs backup tasks, and logs results.

<br>

6. **Monitor Log Files:**
   Check the log files (`safesync.log` and `rsync.log`) for detailed information about the backup process, success, or failure.

<br>
<br>

## Important Notes

- **Backup List File (`backup_list.txt`):**
  The `backup_list.txt` file should contain pairs of source and destination paths, separated by spaces, each pair on a new line.

	```bash
	/complete/path/to/Source/directory_1   /complete/path/where_you_want_to_backup_directory_1/ie_destination_1
	/complete/path/to/Source/directory_2   /complete/path/where_you_want_to_backup_directory_1/ie_destination_2
	/complete/path/to/Source/directory_3   /complete/path/where_you_want_to_backup_directory_1/ie_destination_3
	```

- **Exception Handling:**
  SafeSync excludes files with extensions specified in the `exceptions` array during the backup process. If you don't need any exceptions at all, just leave a blank array like `[]`

- **Directory Creation:**
  The `create_dirs` flag determines whether SafeSync should create destination directories.

- **Logging:**
  Log files (`safesync.log` and `rsync.log`) store detailed information about the backup process, including success and failure messages. So make sure you provide correct path for these logs.

<br>

## Contributions and Issues

Feel free to contribute to SafeSync by submitting issues or pull requests [here](https://github.com/ajayagrawalgit/SafeSync/issues).

## License

This project is licensed under the [MIT License](LICENSE).

<br>
<br>

## 🧑🏻 Know Me More
Developer - <b> Ajay Agrawal </b>
<br>
- 🌌 [Profile](https://github.com/ajayagrawalgit "Ajay Agrawal")
- 🏮 [Email](mailto:ajayagrawalhere@gmail.com?subject=Hi%20from%20<repo-email> "Hi!")
- 👨‍💻 [Linkedin](https://www.linkedin.com/in/theajayagrawal)
- 🐦 [Twitter Bot (@mickbotsays)](https://twitter.com/mickbotsays)


<br>
<h2 align="center"> 🤝 Support Me 🤝 <h2>
<p align="center">
<a href="https://www.buymeacoffee.com/ajayagrawal" title="Buy me a Coffee"><img src="https://user-images.githubusercontent.com/94609372/232127833-d03502af-baf2-46e3-a045-0f7c84531a61.png" alt="Buy me a Coffee"/></a>
</p>
<br><br>
<h4>
<br>
<p align="center"> Made with ♥️ in India </p>
<br>

