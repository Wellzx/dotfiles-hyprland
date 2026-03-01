#!/usr/bin/env bash

dir="$HOME/.config/rofi/modules"
module='launcher'

rofi \
    -show drun \
    -theme ${dir}/${module}.rasi