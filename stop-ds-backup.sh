#!/bin/bash

# ==========================================
# Dark Souls Backup Stopper
# ==========================================
# INSTRUCTIONS FOR USERS:
# This script safely kills the auto-backup loop running in the background.
# In Lutris, add this script as your "Post-exit script" so the backup 
# process stops automatically when you close the game.

pkill -f ds-backup.sh
