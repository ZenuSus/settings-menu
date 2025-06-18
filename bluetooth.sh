#!/bin/sh

# On
bluetooth_on() {
    clear
    sudo systemctl start bluetooth
    echo "✅ Bluetooth is on!."
}

# Off
bluetooth_off() {
    clear
    sudo systemctl stop bluetooth
    echo "✅ Bluetooth is off."
}


# Scan
scan_bluetooth() {
    clear
    echo "⏳ Scanning devices, wait a bit..."
    bluetoothctl scan on &
    SCAN_PID=$!
    sleep 10
    kill $SCAN_PID
    clear
    echo " "
    bluetoothctl devices
    echo " "
}

# Show finded
list_devices() {
    clear
    echo " 🔎 Finded devices:"
    echo " "
    bluetoothctl devices
}

# Pair
pair_device() {
    clear
    read -p "Enter device's MAC-adress: " mac_address
    bluetoothctl pair "$mac_address"
}

# Connect
connect_bluetooth() {
    clear
    read -p "Enter device's MAC-adress: " mac_address
    echo "⏳ Connecting..."
    bluetoothctl connect "$mac_address"
}

# Disconnect
disconnect_bluetooth() {
    clear
    read -p "Enter device's MAC-adress: " mac_address
    echo "⏳ Disconnecting..."
    bluetoothctl disconnect "$mac_address"
}


# Menu
while true; do
    echo "1. ✅ Turn on bluetooth"
    echo "2. ❌ Turn off bluetooth"
    echo "3. 🔎 Scan devices"
    echo "4. 👀 View devices (finded)"
    echo "5. 📡 Pair"
    echo "6. 📲 Connect (to paired)"
    echo "7. ✂️ Disconnect"
    echo "8. 🚪 Exit"
    echo " "
    read -p "Choose the action (1-8):: " choice

    case $choice in
        1) bluetooth_on ;;
        2) bluetooth_off ;;
        3) scan_bluetooth ;;
        4) list_devices ;;
        5) pair_device ;;
        6) connect_bluetooth ;;
        7) disconnect_bluetooth ;;
        8) echo "Exiting..."; clear; setmenu; exit ;;
        *) echo "❌ Wrong number!" ;;

    esac
done
