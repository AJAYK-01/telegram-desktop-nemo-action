#!/bin/sh

arr=()
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for var in "$@"
do
    path=$(readlink -f $var)
    arr+=($path)
done

telegram-desktop -sendpath "${arr[@]}"
wmctrl -x -a Telegram.TelegramDesktop

IFS=$SAVEIFS
