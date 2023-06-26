#!/bin/bash
clear
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
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
NUMBER_OF_CLIENTS=$(grep -c -E "^#vl# " "/etc/vless/.vless.db")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		 echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m            RENEW VLESS ACCOUNT             \033[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
		echo ""
		echo "You have no existing clients!"
        echo ""
		exit 1
	fi
	echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m            RENEW VLESS ACCOUNT             \033[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
         echo "     NO    User    Expired  "
	
	grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 2-3 | nl -s ') '
         echo -e "\033[1;93m────────────────────────────────────────────\033[0m"

	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client you want to renew [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER

        fi
	done
read -p "Extend (days): " masaaktif
user=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/#vl# $user $exp/#vl# $user $exp4/g" /etc/xray/config.json
sed -i "s/#vl# $user $exp/#vl# $user $exp4/g" /etc/vless/.vless.db
systemctl reload xray
clear
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e " \e[1;97;101m       RENNEW VLESS ACCOUNT SUCCESS      \e[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
fi
}
