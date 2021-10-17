#!/usr/bin/env sh

telegram-desktop -sendpath "$@"
wmctrl -x -a Telegram.TelegramDesktop
