#!/bin/bash

# timeout 5 tail --pid=$(pidof nwg-bar) -f /dev/null
sleep 0.05
nwg-bar -t ~/.config/nwg-bar/$1
