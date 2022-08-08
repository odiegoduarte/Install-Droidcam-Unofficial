#!/usr/bin/env bash
#
# droidcam_install.sh - Instala Ddroidcam direto da fonte.
#
# Autor:      Diego Duarte 2020 -2022
# Projeto:    https://github.com/odiegoduarte/Install-Droidcam-Unofficial
#
# ------------------------------------------------------------------------ #
#
#  Esse Shell Script foi criado para remover a versão antiga do droidcam 
#       baixar a última versão oficial do site e instalar o droidcam.
#
# ------------------------------------------------------------------------ #

function print_centered {
     [[ $# == 0 ]] && return 1

     declare -i TERM_COLS="$(tput cols)"
     declare -i str_len="${#1}"
     [[ $str_len -ge $TERM_COLS ]] && {
          echo "$1";
          return 0;
     }

     declare -i filler_len="$(( (TERM_COLS - str_len) / 2 ))"
     [[ $# -ge 2 ]] && ch="${2:0:1}" || ch=" "
     filler=""
     for (( i = 0; i < filler_len; i++ )); do
          filler="${filler}${ch}"
     done

     printf "%s%s%s" "$filler" "$1" "$filler"
     [[ $(( (TERM_COLS - str_len) % 2 )) -ne 0 ]] && printf "%s" "${ch}"
     printf "\n"

     return 0
}

export NEWT_COLORS='
window=,black
border=white,black
textbox=white,black
button=black,white
'
whiptail ...
 {
    for ((i = 0 ; i <= 80 ; i+=7)); do
        sleep 0.1
        echo $i
    done
} | whiptail --gauge " Iniciando o instalador Droidcam " 7 60 0

HEIGHT=17
WIDTH=50
CHOICE_HEIGHT=6
BACKTITLE="Install Droidcam Unofficial"
TITLE="Instalador Droidcam"
MENU="Escolha uma das seguintes opções:"

OPTIONS=(
         1 "Instalar Droidcam"
         2 "Reinstalar Droidcam"
         3 "Sair"
         )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in

 1)

 print_centered "-" "-"
 print_centered "> > > Baixando Droidcam < < <"
 
 echo
 
 cd /tmp/
 wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip  -q --show-progress
 
 echo 
 
 print_centered "-" "-"
 print_centered "Instalando . . . "
 
 echo
 
 unzip droidcam_latest.zip -d droidcam && cd droidcam
 sudo ./install-client
 
 sudo apt install linux-headers-`uname -r` gcc make
 sudo ./install-video
 
 # Opcional usar o droicam via cabo USB
 #sudo apt-get install adb -y
 
 echo 
 
 print_centered "-" "-"
 
 echo

 dialog --title 'Finalizado' --msgbox '  Instalação do Droidcam finalizada com sucesso!' 5 51

 ;; 

# ------------------------------------------------------------------------ #
 2)
 
 echo
 print_centered "-" "-"
 print_centered "Removendo versão anterior."
 
 echo
 
 sudo /opt/droidcam-uninstall
  
 echo

 print_centered "-" "-"
 print_centered "> > > Baixando Droidcam < < <"
 
 echo
 
 cd /tmp/
 wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.2.zip  -q --show-progress
 
 echo 
 
 print_centered "-" "-"
 print_centered "Instalando . . . "
 
 echo
 
 unzip droidcam_latest.zip -d droidcam && cd droidcam
 sudo ./install-client
 
 sudo apt install linux-headers-`uname -r` gcc make
 sudo ./install-video

 # Opcional usar o droicam via cabo USB
 #sudo apt-get install adb -y
 
 echo 
 
 print_centered "-" "-"
 
 echo

 dialog --title 'Finalizado' --msgbox '  Instalação do Droidcam finalizada com sucesso!' 5 51

 ;;

# ------------------------------------------------------------------------ #

 3)
 exit
 ;;
 esac