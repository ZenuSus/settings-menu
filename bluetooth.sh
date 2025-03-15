#!/bin/bash

# Функция для включения блютуза
bluetooth_on() {
    sudo systemctl start bluetooth
    echo "Bluetooth включен."
}

# Функция для выключения блютуза
bluetooth_off() {
    sudo systemctl stop bluetooth
    echo "Bluetooth выключен."
}


# Функция для сканирования
scan_bluetooth() {
    echo "Сканирование устройств, это займёт 10 секунд..."
    bluetoothctl scan on &
    SCAN_PID=$!
    sleep 10  # те самые 10 секунд
    kill $SCAN_PID
    echo "Сканирование завершено."
}

# Функция для просмотра найденных
list_devices() {
    echo "Найденные устройства:"
    bluetoothctl devices
}

# Функция для сопряжения
pair_device() {
    read -p "Введите MAC-адрес устройства: " mac_address
    bluetoothctl pair "$mac_address"
}

# Функция для подключения
connect_bluetooth() {
    read -p "Введите MAC-адрес устройства: " mac_address
    echo "Подключение..."
    bluetoothctl connect "$mac_address"
}

# Функция для отключения
disconnect_bluetooth() {
    read -p "Введите MAC-адрес устройства: " mac_address
    echo "Отключение..."
    bluetoothctl disconnect "$mac_address"
}


# меню
while true; do
    echo "1. Включить Bluetooth"
    echo "2. Выключить Bluetooth"
    echo "3. Сканировать устройства"
    echo "4. Просмотреть найденные устройства"
    echo "5. Сопряжение с устройством"
    echo "6. Подключиться к устройству"
    echo "7. Отключиться от устройства"
    echo "8. Выход"
    read -p "Выберите действие (1-8): " choice

    case $choice in
        1) bluetooth_on ;;
        2) bluetooth_off ;;
        3) scan_bluetooth ;;
        4) list_devices ;;
        5) pair_device ;;
        6) connect_bluetooth ;;
        7) disconnect_bluetooth ;;
        8) echo "Выход..."; break ;;
        *) echo "Введена неверная цифра. Ты промахнулся?" ;;

    esac
done
