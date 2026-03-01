#!/usr/bin/env bash

dir="$HOME/.config/rofi/modules"
module='waybar'

rofi \
    -dmenu \
    -p "Select waybar:" \
    -theme ${dir}/${module}.rasi