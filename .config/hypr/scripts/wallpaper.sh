#!/usr/bin/env bash

# Pasta dos wallpapers
WALLPAPER_DIR="$HOME/Imagens/wallpapers"

# Pega uma imagem aleatória
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Garante que o daemon está rodando (não roda duas vezes)
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 0.5   # dá tempo do daemon inicializar
fi

# Define o wallpaper com transição suave
swww img "$WALLPAPER" --transition-type any --transition-fps 60 --transition-duration 1
