#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear 
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m               MENU DOMAIN                  \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e " [\e[0m•1\e[0m] CHANGE DOMAIN VPS"
echo -e " [\e[0m•2\e[0m] Renew Certificate DOMAIN"
echo -e ""
echo -e " [\e[0m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; addhost ;;
2) clear ; genssl ;;
0) clear ; menu ;;
x) exit ;;
*) echo "Anda salah tekan" ; sleep 1 ; menu-domain ;;
esac
