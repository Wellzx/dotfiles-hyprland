#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Imagens/wallpapers"

# Make sure swww-daemon is running, if not, start it
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 0.5  # give it a moment to start
fi

# List wallpapers in rofi with icons/thumbnails
SELECTED=$(ls "$WALLPAPER_DIR" | while read a; do
  echo -en "$a\0icon\x1f$WALLPAPER_DIR/$a\n"
done | rofi -dmenu -show-icons -p "Choose wallpaper:")

# If user made a choice, apply it using swww
if [ -n "$SELECTED" ]; then
    swww img "$WALLPAPER_DIR/$SELECTED" \
        --transition-type random \
        --transition-fps 60 \
        --transition-duration 1
fi