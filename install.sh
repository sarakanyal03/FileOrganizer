#!/usr/bin/env bash

# Path to this script’s directory
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Copy organizer to a system-wide location (optional)
# Or keep it in project directory and call via absolute path

# Make sure organizer.sh is executable
chmod +x "$BASE_DIR/organizer.sh"

# Create a logs directory (in home or project)
mkdir -p "$HOME/FileOrganizer_logs"

# Add cron job: run daily (or as needed)
# Change the frequency as required (e.g. every 6 hours: "0 */6 * * *")
CRON_CMD="0 2 * * * $BASE_DIR/organizer.sh --dir \"$HOME/some_target_dir\" >> \"$HOME/FileOrganizer_logs/cron_log.txt\" 2>&1"

# Install cron job if not already present
( crontab -l 2>/dev/null | grep -F "$BASE_DIR/organizer.sh" ) && echo "Cron job already exists." || (
    ( crontab -l 2>/dev/null; echo "$CRON_CMD" ) | crontab -
    echo "Cron job installed: $CRON_CMD"
)

echo "Installation complete."

