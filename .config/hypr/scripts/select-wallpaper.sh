#!/bin/bash

WALLPAPER_DIR="$HOME/Imagens/wallpapers"

# Inicia o swww-daemon se não estiver rodando
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 0.5
fi

# Usa find em vez de ls (mais seguro com espaços nos nomes)
SELECTED=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) \
    | while read -r a; do
        fname=$(basename "$a")
        echo -en "$fname\0icon\x1f$a\n"
    done | rofi -dmenu -show-icons -p "Choose wallpaper:")

# Se escolheu, aplica
if [ -n "$SELECTED" ]; then
    swww img "$WALLPAPER_DIR/$SELECTED" \
        --transition-type any \
        --transition-fps 60 \
        --transition-duration 1
fi
