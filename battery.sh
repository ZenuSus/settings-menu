#!/bin/bash

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
    echo "Статус батареи: $STATUS"
    echo "Текущий заряд: $CAPACITY%"
    
    if [ -n "$ENERGY_FULL" ] && [ -n "$ENERGY_FULL_DESIGN" ]; then
        echo "Ёмкость батареи: $ENERGY_FULL / $ENERGY_FULL_DESIGN mWh"
    else
        echo "Информация о ёмкости недоступна :("
    fi
else
	echo "Батарея не найдена (куда подевалась?)"
fi
