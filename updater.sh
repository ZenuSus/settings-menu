#!/bin/bash

clear
echo "Checking updates..."
sleep 2
echo "Creating temp files..."
mkdir /tmp/setmenu-update-tmp
cd /tmp/setmenu-update-tmp
sleep 2
echo "Downloading files..."
git clone https://github.com/ZenuSus/settings-menu
clear
cd settings-menu
# setup new files
sleep 1
echo "Moving files..."
sudo cp setmenu.sh /usr/local/bin/setmenu

if test -d "$HOME/settings-menu"; then
    sleep 1
else
   mkdir $HOME/settings-menu
   sleep 1
fi

sudo cp about.sh $HOME/settings-menu
sudo cp battery.sh $HOME/settings-menu
sudo cp bluetooth.sh $HOME/settings-menu
sudo cp setmenu.sh $HOME/settings-menu
sudo cp updater.sh $HOME/settings-menu
sudo cp wifi.sh $HOME/settings-menu
rm -rf $HOME/settings-menu/setup.sh

clear
cd $HOME
rm -rf /tmp/setmenu-update-tmp
echo "all done!"
exit


