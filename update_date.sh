#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Define the file to update
DATE_FILE="date.txt"

# Get today's date
TODAYS_DATE=$(date '+%Y-%m-%d')

# Update the file with today's date
echo "$TODAYS_DATE" > "$DATE_FILE"

# Check if the file has changed
if git diff --quiet "$DATE_FILE"; then
  echo "No changes detected. Exiting..."
  exit 0
fi

# Configure Git
git config --global user.email "actions@github.com"
git config --global user.name "GitHub Actions"

# Commit and push the change
git add "$DATE_FILE"
git commit -m "Auto-update date to $TODAYS_DATE"
git push origin main
