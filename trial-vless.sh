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
TIMES="10"
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m    CREATE TRIALL VMESS ACCOUNT       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
domain=$(cat /etc/xray/domain)
PUB=$(cat /etc/slowdns/server.pub)
CITY=$(cat /etc/xray/city)
NS=$(cat /etc/xray/dns)
masaaktif=1
Quota=10
user=Trial-VL`</dev/urandom tr -dc 0-9 | head -c3`
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "$masaaktif days" +"%H")
sed -i '/#vless$/a\#vl# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#vl# '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
cat >/var/www/html/vless-$user.txt <<-END
=======================
      P R O J E C T
=======================
 Owner: XlordVpn
=======================
 Format Vless WS (CDN)
=======================

- name: geostore-$user-WS (CDN)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  udp: true
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless WS (CDN) Non TLS
_______________________________
- name: geostore-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
  udp: true
    path: /vless
    headers:
      Host: ${domain}
_______________________________
 Format Vless gRPC (SNI)
_______________________________
- name: geostore-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
  grpc-service-name: vless-grpc
  udp: true
_______________________________
 Link Vless Account
_______________________________
Link TLS : vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&host=${domain}&type=ws#${user}"
_______________________________
Link none TLS : vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=${domain}&type=ws#${user}"
_______________________________
Link GRPC : vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}
_______________________________

END
vlesslink1="vless://${uuid}@${domain}:443?path=/vless&security=tls&encryption=none&host=${domain}&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:80?path=/vless&encryption=none&host=${domain}&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:443?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
TEXT="
<code>────────────────────────────────</code>
<code>  SUCCES CREAT TRIALL VLESS ACCOUNT</code>
<code>────────────────────────────────</code>
<code>Remarks      : ${user}</code>
<code>Domain       : ${domain}</code>
<code>Host Slowdns : ${NS}</code>
<code>Pub Key      : ${PUB}</code>
<code>Location     : $CITY</code>
<code>User Quota   : ${Quota} GB</code>
<code>Port TLS     : 443</code>
<code>Port DNS     : 443, 53</code>
<code>Port NTLS    : 80, 8080, 2086</code>
<code>Port GRPC    : 443</code>
<code>User ID      : ${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Encryption.   :none</code>
<code>Network      : WS or gRPC</code>
<code>Path     : /vless - /multipath</code>
<code>Path Dynamic : CF-XRAY:http://bug.com</code>
<code>───────────────────────────</code>
<code>Link TLS     :</code> 
<code>${vlesslink1}</code>
<code>───────────────────────────</code>
<code>Link NTLS    :</code> 
<code>${vlesslink2}</code>
<code>───────────────────────────</code>
<code>Link GRPC    :</code> 
<code>${vlesslink3}</code>
<code>───────────────────────────</code>
<code>Format OpenClash :</code> https://${domain}:81/vless-$user.txt
<code>───────────────────────────</code>
<code>Expired On : $exp</code>
"
systemctl restart xray
systemctl restart nginx
service cron restart
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vless/${user}
fi
DATADB=$(cat /etc/vless/.vless.db | grep "^#vl#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "#vl# ${user} ${exp} ${uuid} ${Quota}" >>/etc/vless/.vless.db

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m       SUCCES CREAT VLESS ACCOUNT       \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "Location    : $CITY"
echo -e "User Quota  : ${Quota} GB"
echo -e "port TLS    : 443"
echo -e "Port NTLS   : 80, 8080, 2086"
echo -e "Port GRPC   : 443"
echo -e "User ID     : ${uuid}"
echo -e "AlterId     : 0"
echo -e "Security    : auto"
echo -e "Encryption  : none"
echo -e "Path        : /vles - /multipath"
echo -e "Path Dynamic : CF-XRAY:http://bug.com</"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link TLS   : ${vlesslink1}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link NTLS  : ${vlesslink2}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link GRPC  : ${vlesslink3}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Format OpenClash : https://${domain}:81/vless-$user.txt"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Expired On : $exp"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back menu vless"
menu
fi
}
