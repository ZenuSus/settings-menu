#!/bin/bash

clear
echo "ℹ️ About"
echo

# Информация о дистрибутиве
echo "💎 System"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "OS: $NAME"
    echo "Version: $VERSION"
elif [ -f /etc/redhat-release ]; then
    echo "OS: $(cat /etc/redhat-release)"
else
    echo "Info not found :("
fi
echo

# Информация о ядре
echo "🔬 Kernel"
echo "Kernel version: $(uname -r)"
echo "Architexture: $(uname -m)"
echo

# Информация о процессоре
echo "🗜 Proc"
echo "Cpu: $(grep "model name" /proc/cpuinfo | head -n 1 | cut -d ":" -f 2 | sed 's/^[ \t]*//')"
echo "Cores: $(grep -c "processor" /proc/cpuinfo)"
echo

# Информация о памяти
echo "💽 RAM"
free -h | awk '/Mem/{print "Memory: " $3 " / " $2 " in use"}'
echo "Swap: $(free -h | awk '/Swap/{print $3 " / " $2 " in use"}')"
echo

# Информация о дисках
echo "💾 Disk"
df -h | grep -v "tmpfs" | grep -v "udev"
echo

# Информация о сети
echo "📶 Network"
echo "Hostname: $HOST"
echo "IP-adresses: $(hostname -I 2>/dev/null || ip addr show | grep -oP 'inet \K[\d.]+' | grep -v '127.0.0.1' | tr '\n' ' ')"
echo

# Время работы системы
echo "⏱️ Uptime"
uptime -p
echo