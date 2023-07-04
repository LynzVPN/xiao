echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " \e[1;97m             CREATE TRIALL SSH OVPN ACCOUNT       \e[0m"
echo -e "\033[96m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
IP=$(curl -sS ifconfig.me)
LOGIN=Trial-SSH`</dev/urandom tr -dc 0-9 | head -c3`
PASSWD=1
EXPIRED=1
domain=`cat /etc/xray/domain`
useradd -e `date -d "$EXPIRED days" +"%H"` -s /bin/false -M $LOGIN
exp="$(chage -l $LOGIN | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$PASSWD\n$PASSWD\n"|passwd $LOGIN &> /dev/null

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${LOGIN}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${LOGIN}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${LOGIN}\b/d" /etc/ssh/.ssh.db
fi
echo "### ${LOGIN} " >>/etc/ssh/.ssh.db

cat > /var/www/html/ssh-$LOGIN.txt <<-END
=======================
P R O J E C T  O F
=======================
Telegram: 
=======================
Format SSH OVPN Triall Account
=======================

Username         : $LOGIN
Password         : $PASSWD
Expired          : $exp
_______________________________
IP               : $IP
Host             : $domain
Host Slowdns     : ${NS}
Pub Key          : ${PUB}
Location         : $CITY
Port OpenSSH     : 443, 80, 22
Port Dropbear    : 143, 109
Port Dropbear WS : 443, 109
Port SSH WS      : 80
Port SSH SSL WS  : 443
Port SSL/TLS     : 443
Port OVPN WS SSL : 443
Port OVPN SSL    : 1194
Port OVPN TCP    : 1194
Port OVPN UDP    : 2200
Proxy Squid 1    : 3128
Proxy Squid 2    : 8000
Proxy Squid 3    : 8080
BadVPN UDP       : 7100, 7300, 7300
_______________________________
Payload WSS: GET wss://BUG.COM/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf] 
_______________________________
OpenVPN WS SSL : https://$domain:81/"$domain"-ws-ssl.ovpn
OpenVPN SSL : https://$domain:81/"$domain"-ssl.ovpn
OpenVPN TCP : https://$domain:81/"$domain"-tcp.ovpn
OpenVPN UDP : https://$domain:81/"$domain"-udp.ovpn
_______________________________

END
TEXT="
<code>───────────────────────────</code>
<code>      SSH OVPN Account     </code>
<code>───────────────────────────</code>
<code>Username         : $LOGIN</code>
<code>Password         : $PASSWD</code>
<code>Expired          : $exp</code>
<code>───────────────────────────</code>
<code>Host             : $domain</code>
<code>Location         : $CITY</code>
<code>Port SSH UDP     : 1-65535</code>
<code>Port OpenSSH     : 443, 80, 22</code>
<code>Port Dropbear    : 143, 109</code>
<code>Port Dropbear WS : 443, 109</code>
<code>Port DNS         : 443, 53, 22</code> 
<code>Port SSH WS      : 80 </code>
<code>Port SSH SSL WS  : 443</code>
<code>Port SSL/TLS     : 443</code>
<code>Port OVPN WS SSL : 443</code>
<code>Port OVPN SSL    : 443</code>
<code>Port OVPN TCP    : 443, 1194</code>
<code>Port OVPN UDP    : 2200</code>
<code>Proxy Squid      : 3128</code>
<code>BadVPN UDP       : 7100, 7300, 7300</code>
<code>Host Slowdns     : ${NS}</code>
<code>Pub Key          : ${PUB}</code>
<code>───────────────────────────</code>
<code>Payload WS       : GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]</code>
<code>Payload WSS      : GET wss://[host]/ HTTP/1.1[crlf]Host: $domain[host_port][crlf]Upgrade: Websocket[crlf]Connection: Keep-Alive[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>───────────────────────────</code>
<code>OpenVPN WS SSL   : </code>https://$domain:81/"$domain"-ws-ssl.ovpn
<code>OpenVPN SSL      : </code>https://$domain:81/"$domain"-ssl.ovpn
<code>OpenVPN TCP      : </code>https://$domain:81/"$domain"-tcp.ovpn
<code>OpenVPN UDP      : </code>https://$domain:81/"$domain"-udp.ovpn
<code>───────────────────────────</code>
<code>Save Link Account: </code>https://$domain:81/ssh-$LOGIN.txt
<code>───────────────────────────</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL
clear
echo -e "\033[1;93m────────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
    echo -e "\033[42m             TRIAL SSH ACCOUNT              \033[0m" | tee -a /etc/log-create-user.log
echo -e "\033[1;93m────────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username    : $LOGIN" | tee -a /etc/log-create-user.log
echo -e "Password    : $PASSWD" | tee -a /etc/log-create-user.log
echo -e "IP          : $IP" | tee -a /etc/log-create-user.log
echo -e "Domain      : $domain" | tee -a /etc/log-create-user.log
echo -e "\e[33m─────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "OpenSSH     : 22" | tee -a /etc/log-create-user.log
echo -e "SSH-WS      : 80" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS  : 443" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS     : 447 , 777" | tee -a /etc/log-create-user.log
echo -e "DROPBEAR    : 109,143" 
echo -e "UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "SSH-UDP     : 1-65535" | tee -a /etc/log-create-user.log
#echo -e "\e[33m─────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
#echo -e "OpenVPN Config : http://$IP:81/" | tee -a /etc/log-create-user.log
echo -e "\e[33m─────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m─────────────────────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu