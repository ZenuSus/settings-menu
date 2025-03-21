#!/bin/bash

# Функция для сканирования Wi-Fi сетей
scan_wifi() {
    echo "Сканирование сетей, подождите..."
    nmcli dev wifi
}

# Функция для подключения к Wi-Fi сети
connect_wifi() {
    read -p "Введите имя сети (SSID): " ssid
    read -s -p "Введите пароль сети: " password
    echo
    nmcli dev wifi connect "$ssid" password "$password"
}

# Функция для включения Wi-Fi
wifi_on() {
    nmcli radio wifi on
    sudo systemctl start NetworkManager.service
    echo "Wi-Fi включен."
}

# Функция для выключения Wi-Fi
wifi_off() {
    nmcli radio wifi off
    echo "Wi-Fi выключен."
}

# Основное меню
while true; do
    echo "1 - Сканировать сети"
    echo "2 - Подключиться к сети"
    echo "3 - Включить Wi-Fi"
    echo "4 - Выключить Wi-Fi"
    echo "5 - Выход"
    read -p "Выберите действие (1-5): " choice

    case $choice in
        1) scan_wifi ;;
        2) connect_wifi ;;
        3) wifi_on ;;
        4) wifi_off ;;
        5) echo "Выход..."; break ;;
        *) echo "Введена неверная цифра. Ты промахнулся?" ;;
    esac
done
