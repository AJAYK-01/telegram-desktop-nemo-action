#!/bin/sh
telegram-desktop -sendpath "$(readlink -f "$1")"
wmctrl -x -a Telegram.TelegramDesktop
