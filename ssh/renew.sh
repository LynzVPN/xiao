#!/bin/bash
clear
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e "\e[42m                 RENEW  USER             \E[0m"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
read -p "Username : " User

if getent passwd $User >/dev/null 2>&1; then
    ok="ok"
else
    echo -e "Failure: User $User Not Exist."
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
fi

if [ -z $User ]; then
    echo -e "Username cannot be empty "
    echo ""
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
fi

egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
    read -p "Day Extend : " Days
    if [ -z $Days ]; then
        Days="1"
    fi
    Today=$(date +%s)
    Days_Detailed=$(($Days * 86400))
    Expire_On=$(($Today + $Days_Detailed))
    Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
    Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
    passwd -u $User
    usermod -e $Expiration $User
    egrep "^$User" /etc/passwd >/dev/null
    echo -e "$Pass\n$Pass\n" | passwd $User &>/dev/null
    clear
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    echo -e "\e[42m                 RENEW  USER             \E[0m"
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    echo -e "   Username   : $User"
    echo -e "   Days Added : $Days Days"
    echo -e "   Expires on : $Expiration_Display"
else
    clear
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    echo -e "\e[42m                 RENEW  USER             \E[0m"
    echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
    echo -e "Username Doesnt Exist      "
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
