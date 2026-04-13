#!/bin/bash

PacmanApps="font-manager cliphist evince foot fuzzel gvfs glxinfo galculator greetd greetd-tuigreet galculator jq network-manager-applet xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk udiskie simple-scan breeze mako ttf-nerd-fonts-symbols ttf-hack-nerd awesome-terminal-fonts yazi fish waybar lxqt-policykit wlsunset geany grim libreoffice-fresh-cs qt6ct brightnessctl btop fastfetch papirus-icon-theme qutebrowser gparted mpv vlc pamixer pdfarranger rclone qjackctl niri swaybg swayidle swaylock xournalpp zip p7zip wlsunset kitty kwalletmanager kwallet-pam nwg-look xorg-xwayland wayland-protocols thunar thunar-archive-plugin nvidia-settings"

AurApps="autofs bemoji bibata-cursor-theme waypaper" 

echo "##################################################"
echo "#  Spouštím instalaci, můžete zrušit CTRL+C ...  #"
echo "##################################################"
sleep 4
sudo pacman -Syu
echo
echo "#################################"
echo "#  Instalace z repozitáře Arch  #"
echo "#################################"
sudo pacman -S $PacmanApps &&

echo
echo "################################"
echo "#  Instalace z repozitáře Aur  #"
echo "################################"
yay -S $AurApps &&

echo
echo "#######################################"
echo "#  Kopíruji konfiguraci z repozitáře  #"
echo "#######################################"
git clone --bare -b endeavourOS --single-branch https://github.com/lrestj/probook.git $HOME/.cfg.git &&
git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME checkout -f
echo -e "\n"
sleep 4

echo "####################"
echo "#  Nastavení swap  #"
echo "####################"
echo vm.swappiness=10 | sudo tee /etc/sysctl.d/99-swappiness.conf
echo -e "\n"

echo "#########################"
echo "#  Synology nfs shares  #"
echo "#########################"
echo -e "\n"
sudo mkdir /nfs &&
sudo chmod -R ugo+rwx /nfs
sudo cp -f /home/libor/.dotfiles/autofs/* /etc/autofs/
sudo systemctl enable autofs.service
sleep 4

echo
echo "######################"
echo "#  Nastavuji Greetd  #"
echo "######################"
sudo cp -f ~/.dotfiles/greetd/* /etc/greetd/
sudo systemctl enable greetd.service

#Nvidia prime
#echo "Nastavuji Nvidia prime"
#sleep 2
#nvidia-inst --prime

mkdir -p Public Templates Stažené Dokumenty Hudba Videa

echo
echo "################################"
echo "#  Konfigurace Git repozitářů  #"
echo "################################"
git clone https://github.com/lrestj/install $HOME/.dotfiles/install/
cd $HOME/.dotfiles/install/
git remote remove origin
git remote add github git@github.com:lrestj/install.git
git remote add gitlab git@gitlab.com:lrestj/install.git
git config --global user.email "rest@seznam.cz"
git config --global user.name "LrestJ"

git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote remove origin
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add github git@github.com:lrestj/probook.git
git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor remote add gitlab git@gitlab.com:lrestj/probook.git
git config --global user.email "rest@seznam.cz"
git config --global user.name "LrestJ"

echo
echo "###################################"
echo "#  Add $HOME/.local/bin to $PATH  #"
echo "###################################"
sleep 3
EDITOR=vim sudoedit /etc/profile

echo
echo "#####################"
echo "#  KONEC INSTALACE  #" 
echo "#####################"

##### END OF FILE #####
