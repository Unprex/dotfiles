#!/bin/bash

swaymsg input 1267:666:ELAN_Touchscreen map_to_output eDP-1
swaymsg output eDP-1 transform $1
