#!/bin/bash

# Criado por Diego Duarte 2020
# https://github.com/odiegoduarte/Install-Droidcam-Unofficial
# Esse Shell Script foi criado para remover a versão antiga do droidcam baixar a última versão oficial
# do site e instalar o droidcam.

{
    for ((i = 0 ; i <= 100 ; i+=7)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge "Iniciando o instalador do Droidcam" 6 50 0

if (whiptail --title " Seja bem-vindo(a)$(whoami) " --yesno "É um simples shell script que foi criado para fazer instalação automatizada do Droidcam.
No próximo passo irá te pedir a senha de usuário.
Deseja continuar ?" 10 60) then
    echo "Iniciando o instalador do Droidcam. . . "
else
    echo "Instalação do Droidcam.$6 "
fi

#Removendo versões anteriores
sudo /opt/droidcam-uninstall

#Baixando Droidcam
cd /tmp/
wget https://files.dev47apps.net/linux/droidcam_latest.zip
echo "73db3a4c0f52a285b6ac1f8c43d5b4c7 droidcam_latest.zip" | md5sum -c --

#Extraindo e instalando o Droidcam
unzip droidcam_latest.zip -d droidcam && cd droidcam
sudo ./install-client

sudo apt install linux-headers-`uname -r` gcc make
sudo ./install-video

#Instalando adb para usar o Droidcam via cabo usb.
sudo apt-get install adb -y

echo "Instalação finalizada !"