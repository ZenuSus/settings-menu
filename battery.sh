#!/bin/sh

# Путь к информации о батарее (нахера я делаю комментарии в коде?)
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Существует ли путь к батарее (ачо нет)
if [ -d "$BATTERY_PATH" ]; then
    # статус батареи
    STATUS=$(cat "$BATTERY_PATH/status")
    
    # заряд батареи
    CAPACITY=$(cat "$BATTERY_PATH/capacity")
    
    # ёмкость батареи
    ENERGY_FULL=$(cat "$BATTERY_PATH/energy_full" 2>/dev/null)
    ENERGY_FULL_DESIGN=$(cat "$BATTERY_PATH/energy_full_design" 2>/dev/null)
    
    # Вывод инфы
    clear
    echo "🔌 Battery status: $STATUS"
    echo "🔋 Capacity: $CAPACITY%"
    echo " "
    
    if [ -n "$ENERGY_FULL" ] && [ -n "$ENERGY_FULL_DESIGN" ]; then
        echo "⚡️ Battery energy: $ENERGY_FULL / $ENERGY_FULL_DESIGN mWh"
    else
        echo "❌ Cannot get info :("
    fi
else
	echo "❌ Battery not found! (wtf?)"
fi
