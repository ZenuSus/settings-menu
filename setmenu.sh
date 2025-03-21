#!/bin/bash

echo "Добро пожаловать в менеджер настроек. Введите необходимую цифру для продолжения. "
echo "1 - Wi-Fi Подключения"
echo "2 - Bluetooth Подключения"
echo "3 - Управление Батареей"
echo "4 - Настройки Цвета"
echo "5 - О Системе (Fastfetch)"
echo "6 - Выход"
echo " "
echo "Версия: 1.2"

read choice

case $choice in
    1)
        echo "Запуск wi-fi менеджера..."
	clear
        # Wi-Fi
        bash $HOME/settings-menu/wifi.sh
        ;;
    2)
        echo "Запуск bluetooth менеджера..."
	clear
        # Bluetooth
        bash $HOME/settings-menu/bluetooth.sh
        ;;
    3)
        echo "Запуск менеджера батареи..."
	clear
        # Батарея
        bash $HOME/settings-menu/battery.sh
        ;;
    4)
        echo "Запуск цветовых настроек временно недоступен."
        # Цвет
	exit 0
        ;;

    5)
	echo "Запуск fastfetch..."
	clear
        # Fastfetch
	fastfetch
	;;
   
    6)
	echo "Выход..."
	clear
	# Выход
	exit 0
	;;

    *)
        echo "Введена неверная цифра. Ты промахнулся?"
        ;;
esac
