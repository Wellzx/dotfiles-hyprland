#!/usr/bin/env bash

# Define your wallpaper directory
WALLPAPER_DIR="$HOME/Imagens/wallpapers"

# Find a random image in the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n 1)

# Check if swww-daemon is running, if not, start it
swww query || swww-daemon 
sleep 0.2

# Set the wallpaper with a random transition type
swww img "$WALLPAPER" --transition-type random --transition-fps 60