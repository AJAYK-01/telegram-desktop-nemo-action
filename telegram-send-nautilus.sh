#!/bin/bash

telegram-desktop -sendpath "$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"
wmctrl -x -a Telegram.TelegramDesktop

# put this script in  ~/.local/share/nautilus/scripts/ and make executeable