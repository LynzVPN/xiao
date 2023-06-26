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
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m         CREATE TRIAL VMESS  ACCOUNT        \033[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
domain=$(cat /etc/xray/domain)
PUB=$(cat /etc/slowdns/server.pub)
CITY=$(cat /etc/xray/city)
NS=$(cat /etc/xray/dns)
masaaktif=1
Quota=5
user=Trial-VM`</dev/urandom tr -dc 0-9 | head -c3`
clear 
uuid=$(cat /proc/sys/kernel/random/uuid)
exp=$(date -d "$masaaktif days" +"%H")
sed -i '/#vmess$/a\#vm# '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=$(date -d "$masaaktif days" +"%H")
sed -i '/#vmessgrpc$/a\#vm# '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
VMESS_WS=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
VMESS_NON_TLS=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
VMESS_GRPC=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "/vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
cat >/var/www/html/vmess-$user.txt <<-END
==========================
         P R O J E C T 
==========================
 Owner: XlordVpn
==========================
    Format Vmess WS (RHDNS)
==========================

- name: geostore-Vmess-$user-WS (RHDNS)
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
_______________________________________________________
              Format Vmess WS (RHDNS) Non TLS
_______________________________________________________

- name: geostore-$user-WS (RHDNS) Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
_______________________________________________________
              Format Vmess gRPC (SNI)
_______________________________________________________

- name: geostore-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
  grpc-service-name: vmess-grpc
_______________________________________________________
              Link Vmess Triall Account
_______________________________________________________
Link TLS : vmess://$(echo $VMESS_WS | base64 -w 0)
_______________________________________________________
Link none TLS : vmess://$(echo $VMESS_NON_TLS | base64 -w 0)
_______________________________________________________
Link GRPC : vmess://$(echo $VMESS_GRPC | base64 -w 0)
_______________________________________________________



END
vmesslink1="vmess://$(echo $VMESS_WS | base64 -w 0)"
vmesslink2="vmess://$(echo $VMESS_NON_TLS | base64 -w 0)"
vmesslink3="vmess://$(echo $VMESS_GRPC | base64 -w 0)"
TEXT="
<code>────────────────────────────────</code>
<code>  SUCCES CREAT TRIALL VMESS ACCOUNT</code>
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
<code>Network      : WS or gRPC</code>
<code>Path     : /vmess - /multipath</code>
<code>Path Dynamic : CF-XRAY:http://bug.com</code>
<code>───────────────────────────</code>
<code>Link TLS     :</code> 
<code>${vmesslink1}</code>
<code>───────────────────────────</code>
<code>Link NTLS    :</code> 
<code>${vmesslink2}</code>
<code>───────────────────────────</code>
<code>Link GRPC    :</code> 
<code>${vmesslink3}</code>
<code>───────────────────────────</code>
<code>Format OpenClash :</code> https://${domain}:81/vmess-$user.txt
<code>───────────────────────────</code>
<code>Expired On : $exp</code>
"
systemctl restart xray
systemctl restart nginx
service cron restart

if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vmess/${user}
fi
DATADB=$(cat /etc/vmess/.vmess.db | grep "^#vm#" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "#vm# ${user} ${exp} ${uuid} ${Quota}" >>/etc/vmess/.vmess.db

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m           TRIAL VMESS ACCOUNT              \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Remarks      : ${user}"
echo -e "Domain       : ${domain}"
echo -e "Host Slowdns : ${NS}"
echo -e "Pub Key      : ${PUB}"
echo -e "Location     : ${CITY}"
echo -e "User Quota   : ${Quota} GB"
echo -e "Port TLS     : 443"
echo -e "Port NTLS    : 80, 8080, 2086"
echo -e "Port DNS     : 443, 53 "
echo -e "Port GRPC    : 443"
echo -e "User ID      : ${uuid}"
echo -e "AlterId      : 0"
echo -e "Security     : auto"
echo -e "Network      : WS or gRPC"
echo -e "Path TLS     : /vmess - /multipath"
echo -e "Path Dynamic : CF-XRAY:http://bug.com "
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Link WS TLS       : ${vmesslink1}"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Link WS None TLS  : ${vmesslink2}"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Link GRPC         : ${vmesslink3}"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Format OpenClash  : https://${domain}:81/vmess-$user.txt"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Created On        : $hariini"
echo -e "Expired On        : $exp"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back menu vmess"
menu
fi
}
