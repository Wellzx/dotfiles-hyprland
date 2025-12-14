#!/usr/bin/env bash

# Pasta dos wallpapers animados
WALLPAPER_DIR="$HOME/Imagens/wallpapers_animated"

# Mata qualquer mpvpaper rodando
pkill mpvpaper

# Pega o monitor principal (ajuste automático)
MAIN_MONITOR=$(hyprctl monitors -j | jq -r '.[0].name')

# Lista apenas arquivos de vídeo suportados
SELECTED=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.webm" -o -iname "*.mkv" \) \
    | while read -r a; do
        fname=$(basename "$a")
        echo -en "$fname\0icon\x1f$a\n"
    done | rofi -dmenu -p "Choose wallpaper animated:")

# Aplica o vídeo escolhido
if [ -n "$SELECTED" ]; then
    mpvpaper -o "no-audio --loop-playlist" "$MAIN_MONITOR" "$WALLPAPER_DIR/$SELECTED"
fi
