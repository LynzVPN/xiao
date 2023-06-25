#!/bin/bash
clear
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m               LIST MEMBER                  \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "   \033[42mUSERNAME       EXPIRED              \033[0m"
while read expired
do
        AKUN="$(echo $expired | cut -d: -f1)"
        ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 1000 ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp"
        fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "TOTAL ACCOUNT:   \e[1;97;101m$JUMLAH USER \e[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [enter] to back menu ssh"
menu
