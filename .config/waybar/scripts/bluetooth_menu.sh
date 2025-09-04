#!/usr/bin/env bash

# Lista de dispositivos conocidos
devices=$(bluetoothctl devices | awk '{print $2 " " substr($0, index($0,$3))}')

# Menú con wofi
choice=$(echo "$devices" | wofi --dmenu -p "Bluetooth:")

# Extrae la MAC del dispositivo elegido
mac=$(echo "$choice" | awk '{print $1}')

if [ -n "$mac" ]; then
    # Si ya está conectado, desconectar
    if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
        bluetoothctl disconnect "$mac"
    else
        bluetoothctl connect "$mac"
    fi
fi
