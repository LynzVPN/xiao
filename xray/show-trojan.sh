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
NUMBER_OF_CLIENTS=$(grep -c -E "^#tr# " "/etc/trojan/.trojan.db")
        if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo -e " \e[1;97;101m               CONFIG TROJAN ACCOUNT                   \e[0m"
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "You have no existing clients!"
    echo ""
    echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press [ Enter ] to back on menu trojan"
    trojan
fi

  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " \e[1;97;101m                CONFIG TROJAN ACCOUNT                 \E[0m"
  echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
        echo "     No  User  Exp"
        grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 2-3 | nl -s ') '
        until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
                if [[ ${CLIENT_NUMBER} == '1' ]]; then
                        read -rp "Select one client [1]: " CLIENT_NUMBER
                else
                        read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
                fi
        done
user=$(grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=$(cat /etc/xray/domain)
uuid=$(grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
Quota=$(grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^#tr# " "/etc/trojan/.trojan.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
hariini=`date -d "0 days" +"%Y-%m-%d"`
cat >/var/www/html/trojan-$user.txt <<-END
=============================
          P R O J E C T
=============================
Owner: LyyVPN
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
Link Trojan Account
_______________________________
Link WS   : trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}
_______________________________
Link GRPC : trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}
_______________________________



END
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
clear
echo -e ""
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m              TROJAN ACCOUNT                \033[0m"
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
echo -e "Expired On        : $exp"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"

menu-trojan
fi
