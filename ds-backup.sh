#!/bin/bash

# ==========================================
# Dark Souls Auto-Backup Script
# ==========================================
# INSTRUCTIONS FOR USERS:
# Replace the placeholder path below with the exact location of your Dark Souls save file (DRAKS0005.sl2).
# If you are using Lutris/Wine, it is typically located inside your Wine prefix's virtual C: drive.
# Example path: "$HOME/Games/dark-souls/drive_c/users/$USER/Documents/NBGI/DARK SOULS REMASTERED/<Numbers>/DRAKS0005.sl2"

SAVE_FILE="<REPLACE_WITH_YOUR_EXACT_SAVE_FILE_PATH>"

# This is the directory where your timestamped backups will be saved. 
# You can change this path if you prefer to store them elsewhere.
BACKUP_DIR="$HOME/DarkSoulsBackups"

# Creates the backup directory automatically if it doesn't already exist
mkdir -p "$BACKUP_DIR"
echo "Starting Dark Souls auto-backup... (Press Ctrl+C to stop manually)"

# Infinite loop that runs in the background
while true; do
    # Check if the save file exists at the specified path
    if [ -f "$SAVE_FILE" ]; then
        # Generate a timestamp and copy the file
        TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
        cp "$SAVE_FILE" "$BACKUP_DIR/DRAKS0005_$TIMESTAMP.sl2"
        echo "Backup created at $TIMESTAMP"
    else
        echo "Save file not found! Please check the SAVE_FILE path in the script."
    fi

    # Wait time between backups in seconds (300 seconds = 5 minutes).
    # You can change this number to adjust how often backups are created.
    sleep 300
done
