#!/usr/bin/env bash

WAYBAR_DIR="$HOME/.config/waybar"
ROFI_SCRIPT="$HOME/.config/rofi/scripts/rofi-waybar.sh"

# Lista apenas diretórios waybar-*
SELECTED=$(find "$WAYBAR_DIR" -maxdepth 1 -type d -name "waybar-*" \
  | sed "s|$WAYBAR_DIR/||" \
  | "$ROFI_SCRIPT")

# Se nada for selecionado, sai
[ -z "$SELECTED" ] && exit 0

SOURCE_DIR="$WAYBAR_DIR/$SELECTED"

# Copia os arquivos
cp "$SOURCE_DIR/config.jsonc" "$WAYBAR_DIR/config.jsonc"
cp "$SOURCE_DIR/style.css" "$WAYBAR_DIR/style.css"

# Reinicia a Waybar
pkill waybar
waybar &