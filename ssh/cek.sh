echo -e "\033[1;93m─────────────────────────────────────────\033[0m"
echo -e "\e[42m            Detail Member Aktif          \E[0m"
echo -e "\033[1;93m─────────────────────────────────────────\033[0m"

if [ -e "/var/log/auth.log" ]; then
    LOG="/var/log/auth.log"
fi
if [ -e "/var/log/secure" ]; then
    LOG="/var/log/secure"
fi

data=($(ps aux | grep -i dropbear | awk '{print $2}'))
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" >/tmp/login-db.txt
for PID in "${data[@]}"; do
    cat /tmp/login-db.txt | grep "dropbear\[$PID\]" >/tmp/login-db-pid.txt
    NUM=$(cat /tmp/login-db-pid.txt | wc -l)
    USER=$(cat /tmp/login-db-pid.txt | awk '{print $10}')
    IP=$(cat /tmp/login-db-pid.txt | awk '{print $12}')
    if [ $NUM -eq 1 ]; then
        echo "$PID - $USER - $IP"
    fi

done
echo " "
cat $LOG | grep -i sshd | grep -i "Accepted password for" >/tmp/login-db.txt
data=($(ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'))

for PID in "${data[@]}"; do
    cat /tmp/login-db.txt | grep "sshd\[$PID\]" >/tmp/login-db-pid.txt
    NUM=$(cat /tmp/login-db-pid.txt | wc -l)
    USER=$(cat /tmp/login-db-pid.txt | awk '{print $9}')
    IP=$(cat /tmp/login-db-pid.txt | awk '{print $11}')
    if [ $NUM -eq 1 ]; then
        echo "$PID - $USER - $IP"
    fi

done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
    echo " "

    cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' >/tmp/vpn-login-tcp.txt
    cat /tmp/vpn-login-tcp.txt
fi

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
    echo " "

    cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' >/tmp/vpn-login-udp.txt
    cat /tmp/vpn-login-udp.txt
fi
rm -f /tmp/login-db-pid.txt
rm -f /tmp/login-db.txt
rm -f /tmp/vpn-login-tcp.txt
rm -f /tmp/vpn-login-udp.txt
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
