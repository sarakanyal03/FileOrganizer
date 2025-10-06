# File Organizer and Cleaner

### *An automation project to organize and clean files using Bash scripting.*

---

## Project Overview
The **File Organizer and Cleaner** is a simple Bash automation tool that scans a selected folder and automatically sorts files into categorized subfolders such as **Documents**, **Images**, **Videos**, **Archives** and **code**.

It helps keep your system clutter-free by automating the file management process. The script also maintains a **log file** for all file movements and provides an **undo feature** to safely previous operations.

---

## Objectives

- Automate the process of organizing files.
- Reduce manual effort in sorting data.
- Maintain logs of all file movements.
- Provide undo functionality for safety
- Demonstrate usage of **Git**, **GitHub**, and **shell scripting**.

---

## Features
- Automatically categorizes files based on their type.
- Maintain `.organizer.log` for tracking operations.
- Undo functionality for safe reversal of file moves.
- Dry-run mode for preview before actual execution.
- Simple, portable and customizable Bash script.
- Integrated with Git and GitHub for version control.

---
## Tools & Technologies

| Tool | Purpose |
|------|----------|
| **Bash Scripting** | Automation and file management |
| **Git & GitHub** | Version control and project tracking |
| **Git Bash** | Command-line execution|
| **Cron Jobs** | Task scheduling and automation |

---

## How It Works
1. The user specifies a target directory using `--dir`.
2. The script identifies file types based on extension.
3. Files are moved into categorized folders (Documents, Images, etc.).
4. Each move is logged in `organizer.log` with timestamps.
5. Users can preview actions using `--dryrun`.
6. Undo operations are possible using the `--undo` flag.

---
## Folder Structure
FileOrganizer/
├── organizer.sh # Main Bash script
├── README.md # Project documentation
├── test_files/ # Folder with sample files
│ ├── Audio/
│ ├── Documents/
│ ├── Images/
│ ├── .organizer.log
└── .git/ # Git tracking folder
  

---

## 💻 Usage Instructions

### Step 1: Clone the Repository
```bash
git clone https://github.com/sarakanyal/FileOrganizer.git
cd FileOrganizer
```

### Step 2: Make the script executable
```
chmod +x organizer.sh
```

### Step 3: Run in Dry-Run Mode (Preview Changes)
```
./organizer.sh --dir "./test_files" --dryrun
```

### Step 4: Run for Actual File Organization
```
./organizer.sh --dir "./test_files"
```

### Step 5: Undo Last Operation
```
./organizer.sh --dir "./test_files" --undo 2
```
### Output
Dryrun
![Dryrun](https://github.com/sarakanyal03/FileOrganizer/blob/main/dryrun.png)

Actual Run
![Actual Run](https://github.com/sarakanyal03/FileOrganizer/blob/main/actualrun.png)


### File Categories

| File Type | Folder Name  | Extensions                          |
| --------- | ------------ | ----------------------------------- |
| Images    | `Images/`    | jpg, jpeg, png, gif                 |
| Audio     | `Audio/`     | mp3, wav, ogg                       |
| Videos    | `Videos/`    | mp4, mkv, avi, mov                  |
| Documents | `Documents/` | pdf, txt, doc, docx, xls, ppt       |
| Archives  | `Archives/`  | zip, rar, tar, gz, 7z               |
| Code      | `Code/`      | py, c, cpp, java, js, html, css, sh |
| Others    | `Others/`    | Uncategorized files                 |


### Logging and Undo Mechanism

All file movements are recorded in .organizer.log with:
-Timestamp
-Source and destination paths
-File checksum (for verification)
-Undo reads from this log and moves files back to their original locations.


### Git Commands Used 
| Command                   | Description                        |
| ------------------------- | ---------------------------------- |
| `git clone <URL>`         | Clone GitHub repository locally    |
| `git add .`               | Stage modified or new files        |
| `git commit -m "message"` | Save project snapshot              |
| `git push origin main`    | Upload commits to GitHub           |
| `git pull origin main`    | Get updates from remote repository |
| `git status`              | Check current tracking status      |


### Testing & Results

-Tested the script with various file types.
-Verified correct creation of categorized folders.
-Confirmed .organizer.log entries for every movement.
-Verified undo function restored files properly.
-Confirmed dry-run mode works safely without moving files.


### Conclusion

The File Organizer and Cleaner successfully automates the process of sorting and managing files using a Bash script.
It demonstrates efficient use of Linux commands, Git version control, and automation techniques for real-world file management.
The project is lightweight, easy to use, and can be extended further with GUI or scheduling features.
