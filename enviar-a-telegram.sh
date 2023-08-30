#!/bin/bash

# Crear archivo
sudo bash -c 'echo "#!/usr/bin/env bash
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

IFS=$SAVEIFS" > /usr/share/nemo/actions/enviar-a-telegram.sh'

# Haciendolo ejecutable
sudo chmod +x /usr/share/nemo/actions/enviar-a-telegram.sh

echo "Script creado en /usr/share/nemo/actions/enviar-a-telegram.sh y hecho ejectuable."

# Crear archivo .nemo_action
sudo bash -c 'echo "[Nemo Action]
Name=Enviar a Telegram
Comment=Envía a un chat de Telegram cualquier archivo.
Quote=double
Exec=enviar-a-telegram.sh %F
Icon-Name=org.telegram.desktop
Selection=NotNone
Extensions=nodirs;
Dependencies=telegram-desktop" > /usr/share/nemo/actions/enviar-a-telegram.nemo_action'

echo "El archivo .nemo_action fue creado en /usr/share/nemo/actions/enviar-a-telegram.nemo_action."
