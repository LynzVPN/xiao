#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/LynzVPN/permission/main/ipmini | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/LynzVPN/permission/main/ipmini | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";

exit 0
fi
clear
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          SSH & OVPN MENU          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Buat Akun SSH & OpenVPN "
echo -e " [\e[36m•2\e[0m] Akun Trial SSH & OpenVPN "
echo -e " [\e[36m•3\e[0m] Perpanjang Akun SSH & OpenVPN "
echo -e " [\e[36m•4\e[0m] Hapus SSH & OpenVPN Account "
echo -e " [\e[36m•5\e[0m] Periksa Login Pengguna SSH & OpenVPN "
echo -e " [\e[36m•6\e[0m] Daftar Anggota SSH & OpenVPN "
echo -e " [\e[36m•7\e[0m] Hapus Pengguna Kedaluwarsa SSH & OpenVPN "
echo -e " [\e[36m•8\e[0m] Siapkan Autokill SSH "
echo -e " [\e[36m•9\e[0m] Cek Pengguna yang Melakukan Multi Login SSH "
echo -e " [\e[36m•10\e[0m] Cek Data User Account SSH "
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mKEMBALI KE MENU\033[0m"
echo -e ""
echo -e   "Press x or [ Ctrl+C ] • Untuk-Keluar"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m       •Auto Script Xiao•         \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; usernew ; exit ;;
2) clear ; trial ; exit ;;
3) clear ; renew ; exit ;;
4) clear ; hapus ; exit ;;
5) clear ; cek ; exit ;;
6) clear ; member ; exit ;;
7) clear ; delete ; exit ;;
8) clear ; autokill ; exit ;;
9) clear ; ceklim ; exit ;;
10) clear ; show-ssh ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu-ssh ;;
esac
