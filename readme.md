# Dark-Souls-Bonfire

Automated Dark Souls save state manager for Linux/Lutris Wine prefixes.

## The Problem
Dark Souls is notoriously unforgiving, and that extends to its save system. The game uses a single auto-save file (`DRAKS0005.sl2`) that is constantly overwritten. If you experience a random crash, a power outage, or a forced shutdown exactly when the game is writing to the disk, that single save file becomes corrupted. Without multiple save slots, a corruption means losing hundreds of hours of progress and being forced to start a new game. 

## What This Does
This repository provides a lightweight, automated background backup system designed specifically for Linux gamers using Lutris/Wine. It acts like an automated Git commit for your save file.

* **`ds-backup.sh`**: A background daemon that copies your save file every 5 minutes (customizable) and archives it in a designated folder with a timestamp.
* **`stop-ds-backup.sh`**: A quick utility script that safely kills the backup loop when you exit the game, ensuring it doesn't run indefinitely in the background.

## Setup Instructions for Lutris

### 1. Configure the Script
1. Clone this repository or download the scripts to your machine.
2. Open `ds-backup.sh` in a text editor.
3. Locate the `SAVE_FILE` variable and replace the placeholder path with the exact path to your `DRAKS0005.sl2` file inside your Lutris Wine prefix. 
   *(Example: `~/Games/dark-souls/drive_c/users/$USER/Documents/NBGI/DARK SOULS REMASTERED/12345/DRAKS0005.sl2`)*
4. Make both scripts executable by running this in your terminal:
   ```bash
   chmod +x /path/to/ds-backup.sh
   chmod +x /path/to/stop-ds-backup.sh
   ```

### 2. Add to Lutris
1. Open Lutris, right-click on your Dark Souls game, and select **Configure**.
2. Go to the **System options** tab and scroll down.
3. In the **Pre-launch script** field, click Browse and select your `ds-backup.sh` file.
4. **CRITICAL:** Immediately below that, **uncheck/disable** the toggle for *Wait for pre-launch script to complete*. If you leave this checked, the game will never launch because Lutris will wait forever for the backup loop to finish.
5. In the **Post-exit script** field, click Browse and select your `stop-ds-backup.sh` file.
6. Click **Save** in the top right corner.

Now, whenever you launch the game through Lutris, the script will silently back up your save every few minutes in the background, and seamlessly shut itself down when you quit.

## How to Restore a Backup
If the worst happens and your active save gets corrupted:
1. Ensure the game is fully closed.
2. Navigate to your backup folder (default is `~/DarkSoulsBackups`).
3. Find the most recent backup before the crash occurred (e.g., `DRAKS0005_2026-11-12_18-30-00.sl2`).
4. Copy the file, rename it to exactly `DRAKS0005.sl2`, and paste it into your game's Wine prefix save directory, overwriting the corrupted file.
5. Launch the game and continue your journey!