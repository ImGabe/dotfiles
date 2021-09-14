#!/bin/bash
#
# ~/.xinitrc

sxhkd &
xrdb ~/.Xresources
feh --bg-scale ./dotfiles/wallpaper.png &
exec berry
