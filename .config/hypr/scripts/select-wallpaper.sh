#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
SELECT_WALLPAPER="$HOME/.config/rofi/scripts/rofi-wallpaper.sh"

SELECTED=$(find "$WALLPAPER_DIR" -type f \
  \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) |
while read -r a; do
  fname=$(basename "$a")
  echo -en "$fname\0icon\x1f$a\n"
done | "$SELECT_WALLPAPER")

if [ -n "$SELECTED" ]; then
  swww img "$WALLPAPER_DIR/$SELECTED" \
    --transition-type any \
    --transition-fps 60 \
    --transition-duration 2
fi