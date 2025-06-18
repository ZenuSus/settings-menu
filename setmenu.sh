#!/bin/bash

echo "Setmenu 2.1"
echo " "
echo "1 - 🛜 Wi-Fi"
echo "2 - 💠 Bluetooth"
echo "3 - 🔋 Battery"
echo "4 - 🖥 Display"
echo "5 - ℹ️ About system"
echo "6 - 🚪 Exit"
echo " "
echo "Enter option number:"

read choice

case $choice in
    1)
        echo " "
        echo "⌛️ Loading..."
        sleep 1
	clear
        # Wi-Fi
        sh $HOME/settings-menu/wifi.sh
        ;;
    2)
        echo " "
        echo "⌛️ Loading..."
        sleep 1
	clear
        # Bluetooth
        sh $HOME/settings-menu/bluetooth.sh
        ;;
    3)
        echo " "
        echo "⌛️ Loading..."
        sleep 1
	clear
        # Battery
        sh $HOME/settings-menu/battery.sh
        ;;
    4)
        echo " "
        echo "❌ Temporary unavailable"
        sleep 1
        clear
        # Display
	exit 0
        ;;

    5)
        echo " "
	    echo "⌛️ Loading..."
	clear
        # About
	sh $HOME/settings-menu/about.sh
	;;
   
    6)
        echo " "
	    echo "Exiting..."
	clear
	    # Exit
	exit 0
	;;

    *)
        echo ""
        echo "❌ Wrong number"
        ;;
esac
