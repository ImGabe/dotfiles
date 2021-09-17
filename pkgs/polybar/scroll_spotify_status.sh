#!/usr/bin/env bash

zscroll -l 20 \
        --delay 0.2 \
        --scrollpadding "  " \
        --matchcommand "bash $HOME/.config/polybar/get_spotify_status.sh --status" \
        --matchtext "Playing" "-s 1" \
        --matchtext "Paused" "-s 0" \
        --updatecheck "bash $HOME/.config/polybar/get_spotify_status.sh" &

wait