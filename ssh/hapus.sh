clear
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m               MEMBER SSH ACCOUNT                  \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "\033[1;36m  USERNAME          EXP DATE          \033[0m "
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "  $AKUN" "  $exp     "
else
printf "%-17s %2s %-17s %2s \n" "  $AKUN" "  $exp     "
fi
fi
done < /etc/passwd
echo -e ""
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m               DELETE ACCOUNT                  \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
read -p "  Username : " Pengguna
clear
if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        rm -rf /var/www/html/ssh-$LOGIN.txt
        TEXT="
<code>───────────────────────────</code>
<code>      SUCCES DELETE SSH    </code>
<code>───────────────────────────</code>
<code>Username         : $Pengguna</code>
<code>Expired          : $exp</code>
<code>───────────────────────────</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL
clear
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m            SUCCES DELETE SSH ACCOUNT                  \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo " Client Name : $Pengguna"
echo " Expired On  : $exp"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo ""
else
echo -e "  Failure: User $Pengguna Tidak Di Temukan."
fi
read -n 1 -s -r -p "Press [enter] to back menu ssh"
menu
