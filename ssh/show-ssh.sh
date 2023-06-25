NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/ssh/.ssh.db")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
                echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m             Check Member Ssh Account                  \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
                echo ""
                echo "You have no existing clients!"
                clear
                exit 1
        fi

        echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m             Check Member Ssh Account                  \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
        echo " Select the existing client to view the config"
        echo " Press CTRL+C to return"
		echo -e "\033[0;34m────────────────────────────────────────────\033[0m"
        echo "     No  Expired   User"
        grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
IP=$(curl -sS ifconfig.me)
user=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
pass=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
domain=`cat /etc/xray/domain`
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$pass\n$pass\n"|passwd $user &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`
clear
echo -e "\e[33m────────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m       SSH & OVPN ACCOUNT            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m────────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username    : $user" | tee -a /etc/log-create-user.log
echo -e "Password    : $passwd" | tee -a /etc/log-create-user.log
echo -e "IP          : $IP" | tee -a /etc/log-create-user.log
echo -e "Domain        : $domain" | tee -a /etc/log-create-user.log
echo -e "\e[33m────────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "OpenSSH     : 22" | tee -a /etc/log-create-user.log
echo -e "SSH-WS      : 80" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS  : 443" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS     : 447 , 777" | tee -a /etc/log-create-user.log
echo -e "SlowDNS     : 53,5300,443" 
echo -e "UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "SSH-80      : $domain:80@$user:$passwd"
echo -e "SSH-443     : $domain:443@$user:$passwd"
echo -e "SSH-UDP     : 1-65535" | tee -a /etc/log-create-user.log
echo -e "SETING-UDP  : $domain:1-65535@$user:$passwd"
echo -e "\e[33m────────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "OpenVPN Config : http://$IP:81/" | tee -a /etc/log-create-user.log
echo -e "\e[33m────────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On     : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m────────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
