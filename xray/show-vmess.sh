NC='\e[0m'

DEFBOLD='\e[39;1m'

RB='\e[31;1m'

GB='\e[32;1m'

YB='\e[33;1m'

BB='\e[34;1m'

MB='\e[35;1m'

CB='\e[35;1m'

WB='\e[37;1m'

# ==========================================

# Color

RED='\033[0;31m'

NC='\033[0m'

GREEN='\033[0;32m'

ORANGE='\033[0;33m'

BLUE='\033[0;34m'

PURPLE='\033[0;35m'

CYAN='\033[0;36m'

LIGHT='\033[0;37m'

# ==========================================

clear

NUMBER_OF_CLIENTS=$(grep -c -E "^#vm# " "/etc/vmess/.vmess.db")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m         CONFIG VMESS ACCOUNT           \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press [ Enter ] to back on menu vmess"
    vmess
fi

  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "  \e[1;97;101m        CONFIG VMESS ACCOUNT         \E[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  User  Exp"
        grep -E "^#vm# " "/etc/vmess/.vmess.db" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(grep -E "^#vm# " "/etc/vmess/.vmess.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
uuid=$(grep -E "^#vm# " "/etc/vmess/.vmess.db" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
Quota=$(grep -E "^#vm# " "/etc/vmess/.vmess.db" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vm# " "/etc/vmess/.vmess.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
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
Owner: t.me/RizkiHdyt99
==========================
    Format Vmess WS (CDN)
==========================

- name: geostore-Vmess-$user-WS (CDN)
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
              Format Vmess WS (CDN) Non TLS
_______________________________________________________

- name: geostore-$user-WS (CDN) Non TLS
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
              Link Vmess Account
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

clear
echo -e ""
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m              VMESS ACCOUNT                 \033[0m"
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
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu-vmess
fi
