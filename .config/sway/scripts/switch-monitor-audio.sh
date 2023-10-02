#!/bin/bash

nvidia_card=$(pactl list cards | awk '/Card #/{card=$2; gsub("#", "", card)} /NVIDIA/{print card; exit}')
profile=$(echo -e "output:hdmi-stereo\noutput:hdmi-stereo-extra1\noutput:hdmi-stereo-extra2" | bemenu)
pactl set-card-profile $nvidia_card $profile
sleep 0.2
default_sink=$(pactl list short sinks | grep hdmi | awk '{print $2}')
pactl set-default-sink $default_sink

