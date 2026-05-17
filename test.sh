#!/usr/bin/env bash
set -euo pipefail

PLUGIN="/home/user/Desktop/hyprwinwrap/build/libhyprwinwrap.so"

echo "Unloading $PLUGIN"
hyprctl plugin unload "$PLUGIN" && echo "Loading $PLUGIN" && hyprctl plugin load "$PLUGIN"
