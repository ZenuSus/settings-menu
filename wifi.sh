#!/bin/sh

# Scanning
scan_wifi() {
    clear
    echo "⏳ Scanning networks, wait a bit..."
    sleep 3
    clear
    echo " "
    nmcli dev wifi
    echo " "
}

# Connect
connect_wifi() {
    clear
    read -p "Enter network name (SSID): " ssid
    read -s -p "Enter network password: " password
    sleep 0.5
    clear
    echo "⏳ Connecting..."
    sleep 1
    clear
    nmcli dev wifi connect "$ssid" password "$password"
    sleep 1
    clear
}

# Turn on
wifi_on() {
    sudo systemctl start NetworkManager.service
    nmcli radio wifi on
    echo "✅ Wi-Fi is on"
    sleep 1
    clear
}

# Turn off
wifi_off() {
    nmcli radio wifi off
    echo "✅ Wi-Fi is off"
    sleep 1
    clear
}

# Main menu
while true; do
    echo " "
    echo "🛜 Network name: $(iwconfig wlan0 2>/dev/null | grep 'ESSID' | awk -F'"' '{print $2}')"
    echo "📶 Signal strength: $(iwconfig wlan0 2>/dev/null | grep 'Quality' | awk -F'=' '{print $2}' | awk '{print $1}')"
    echo " "
    echo "1 - 🔎 Scan networks"
    echo "2 - 📡 Connect to Wi-Fi"
    echo "3 - ✅ Turn on Wi-Fi"
    echo "4 - ❌ Turn off Wi-Fi"
    echo "5 - 🚪 Exit"
    read -p "Choose the action (1-5): " choice

    case $choice in
        1) scan_wifi ;;
        2) connect_wifi ;;
        3) wifi_on ;;
        4) wifi_off ;;
        5) echo "Exit"; clear; exit ;;
        *) echo "Wrong number!"; sleep 1 ;;
    esac
done
