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
  
