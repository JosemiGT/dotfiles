#!/usr/bin/env bash

power=$(echo "show" | bluetoothctl | grep "Powered:" | awk '{print $2}')
connected=$(echo "info" | bluetoothctl | grep "Device" | wc -l)

if [ "$power" == "yes" ]; then
  if [ "$connected" -gt 0 ]; then
    echo " $connected"   # Icono Bluetooth conectado
  else
    echo "󰂯"            # Encendido, sin dispositivos
  fi
else
  echo "󰂲"                # Icono apagado
fi
