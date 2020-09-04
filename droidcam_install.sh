#!/bin/bash

# Criado por Diego Duarte 2020
# https://github.com/odiegoduarte/Install-Droidcam-Unofficial
#
# Esse Shell Script foi criado para remover a versão antiga do droidcam baixar a última versão oficial
# do site e instalar o droidcam.


sudo /opt/droidcam-uninstall

cd /tmp/
wget https://files.dev47apps.net/linux/droidcam_latest.zip
echo "73db3a4c0f52a285b6ac1f8c43d5b4c7 droidcam_latest.zip" | md5sum -c --

unzip droidcam_latest.zip -d droidcam && cd droidcam
sudo ./install

sudo apt-get install adb -y