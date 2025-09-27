#!/bin/bash
# ~/ .config/hypr/scripts/LockScreen.sh
# Script para travar a tela com Hyprlock e pausar música

# --- Pausa música  ---
# Se não tiver player rodando, ignora o erro
playerctl pause 2>/dev/null

# --- Chama o Hyprlock ---
hyprlock

# --- Após desbloquear, opcional: tocar música novamente ---
playerctl play 2>/dev/null