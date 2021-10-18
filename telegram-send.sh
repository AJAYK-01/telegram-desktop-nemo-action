#!/usr/bin/env bash

arr=()
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for var in "$@"
do
    path=$(readlink -f $var)
    arr+=($path)
done

# Check if the client is a native app
if [ $(command -v telegram-desktop) ]; then
    telegram-desktop -sendpath "${arr[@]}"
    wmctrl -x -a Telegram.TelegramDesktop
else
    flatpak run --file-forwarding org.telegram.desktop -sendpath @@ "${arr[@]}" @@
    wmctrl -x -a Telegram
fi

IFS=$SAVEIFS
