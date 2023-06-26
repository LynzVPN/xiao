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
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
domain=$(cat /etc/xray/domain)
PUB=$(cat /etc/slowdns/server.pub)
CITY=$(cat /etc/xray/city)
NS=$(cat /etc/xray/dns)
TIMES="10"
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m         CREATE TRIAL TROJAN ACCOUNT        \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
masaaktif=1
Quota=1
user=Trial-TR`</dev/urandom tr -dc 0-9 | head -c3`
clear
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "$masaaktif days" +"%H")
sed -i '/#trojanws$/a\#tr# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#tr# '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
cat >/var/www/html/trojan-$user.txt <<-END
=============================
         P R O J E C T
=============================
 Owner: 
=============================
 Format Trojan GO/WS (CDN)
=============================

- name: Trojan-$user-GO/WS (CDN)
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}
_______________________________
  Format Trojan gRPC
_______________________________

- name: Trojan-$user-gRPC (SNI)
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojan-grpc

_______________________________
Link Trojan Triall Account
_______________________________
Link WS : trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}
_______________________________
Link GRPC : trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}
_______________________________



END
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"

TEXT="
<code>──────────────────────────</code>
<code>    SUCCES CREAT TRIALL TROJAN</code/>
<code>──────────────────────────</code>
<code>Remarks      : ${user}</code>
<code>Domain       : ${domain}</code>
<code>Host Slowdns : ${NS}</code>
<code>Pub Key     : ${PUB}</code>
<code>Location     : $CITY</code>
<code>User Quota   : ${Quota} GB</code>
<code>Port DNS     : 443,53</code>
<code>Port WS(TLS)  : 443</code>
<code>Port GRPC     : 443</code>
<code>User ID     : ${uuid}</code>
<code>AlterId      : 0</code>
<code>Security    : auto</code>
<code>Network    : WS(TLS) or gRPC</code>
<code>ServiceName  : trojan-grpc</code>
<code>──────────────────────────</code>
<code>Link TLS     :</code> 
<code>${trojanlink}</code>
<code>───────────────────────────</code>
<code>Link NTLS    :</code> 
<code>${trojanlink1}</code>
<code>───────────────────────────</code>
<code>Format OpenClash :</code> 
https://${domain}:81/trojan-$user.txt
<code>️Expired On : $exp</code>
<code>──────────────────────────</code>
"
systemctl restart xray
systemctl restart nginx
service cron restart
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
fi
DATADB=$(cat /etc/trojan/.trojan.db | grep "^#tr#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "#tr# ${user} ${exp} ${uuid} ${Quota}" >>/etc/trojan/.trojan.db

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m            TRIAL TROJAN ACCOUNT            \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Remarks        : ${user}"
echo -e "Host           : ${domain}"
echo -e "Location       : ${CITY}"
echo -e "User Quota     : ${Quota} GB"
echo -e "Port WS(TLS)   : 443"
echo -e "Port  gRPC     : 443"
echo -e "User ID        : ${uuid}"
echo -e "AlterID        : 0"
echo -e "Security       : auto"
echo -e "Path           : /trojan"
echo -e "Network        : WS(TLS) or gRPC"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Link WS          : ${trojanlink}"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Link GRPC        : ${trojanlink1}"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Format OpenClash : https://${domain}:81/trojan-$user.txt"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Created On       : $hariini"
echo -e "Expired On       : $exp"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
fi
}
