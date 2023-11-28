#!/bin/bash

cd ~/anki/bin

source activate

DISABLE_QT5_COMPAT=1 ANKI_WAYLAND=1 nohup ./anki &
