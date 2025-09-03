#!/usr/bin/env bash

# Pega os PIDs do waybar do seu usuário
PIDS=$(ps -u "$USER" -o pid,comm | grep "[w]aybar" | awk '{print $1}')

if [ -n "$PIDS" ]; then
    echo "Fechando waybar..."
    echo "$PIDS" | xargs kill -9
else
    echo "Abrindo waybar..."
    waybar &
fi