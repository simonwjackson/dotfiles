#!/bin/bash

rofi -l 0 -dmenu -p "Task" | xargs -I % sh -c 'task add %'
