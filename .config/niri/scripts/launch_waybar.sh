#!/bin/bash

killall waybar

sleep 0.5

waybar > /dev/null 2>&1 &
