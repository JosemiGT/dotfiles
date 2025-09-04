#!/usr/bin/env bash

power=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [ "$power" == "yes" ]; then
    bluetoothctl power off
else
    bluetoothctl power on
fi
