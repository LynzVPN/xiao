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

NUMBER_OF_CLIENTS=$(grep -c -E "^#vl# " "/etc/vless/.vless.db")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m                CONFIG VLESS ACCOUNT                   \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press [ Enter ] to back on menu vless"
    vless
fi

  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e "  \e[1;97;101m        CONFIG VLESS ACCOUNT         \E[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  User  Exp"
        grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
uuid=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
Quota=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#vl# " "/etc/vless/.vless.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
cat >/var/www/html/vless-$user.txt <<-END
=======================
      P R O J E C T
=======================
Owner: t.me/RizkiHdyt99
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
clear
echo -e ""
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m              VLESS ACCOUNT                 \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Remarks     : ${user}"
echo -e "Domain      : ${domain}"
echo -e "Location    : ${CITY}"
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
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Link WS TLS       : ${vlesslink1}"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Link WS None TLS  : ${vlesslink2}"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Link GRPC         : ${vlesslink3}"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Format OpenClash  : https://${domain}:81/vless-$user.txt"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "Created On        : $hariini"
echo -e "Expired On        : $exp"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu-vless
fi
