#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
aureb=$(cat /home/re_otm)
clear
echo " "
echo -e "$BICyan┌──────────────────────────────────────────┐${NC}"
echo -e "$BICyan│           SERVER PORT INFORMATION        │$NC"       
echo -e "$BICyan└──────────────────────────────────────────┘${NC}"
echo -e "\033[1;93m  >Port SSH Websocket       :80\e[0m"
echo -e "\033[1;93m  >Port SSH Websocket SSL   :443\e[0m"
echo -e "\033[1;93m  >Port SSH SSL             :447,777\e[0m"
echo -e "\033[1;93m  >Port OpenSSH             :22\e[0m"
echo -e "\033[1;93m  >Port SSH Dropbear        :109,143\e[0m"
echo -e "\033[1;93m  >Port Xray None TLS       :80\e[0m"
echo -e "\033[1;93m  >Port Xray TLS            :443\e[0m"
echo -e "\033[1;93m  >Port Vmess None TLS      :80\e[0m"
echo -e "\033[1;93m  >Port Vmess TLS           :443\e[0m"
echo -e "\033[1;93m  >Port Vmess GRPC          :443\e[0m"
echo -e "\033[1;93m  >Port Vless None TLS      :80\e[0m"
echo -e "\033[1;93m  >Port Vless TLS           :443\e[0m"
echo -e "\033[1;93m  >Port Vless GRPC          :443\e[0m"
echo -e "\033[1;93m  >Port Trojan WS           :443\e[0m"
echo -e "\033[1;93m  >Port Trojan GRPC         :443\e[0m"
echo -e "\033[1;93m  >Port ShadowSocks WS      :443\e[0m"
echo -e "\033[1;93m  >Port ShadowSocks GRPC    :443\e[0m"
echo -e ""
echo -e "$BICyan┌──────────────────────────────────────────┐${NC}"
echo -e "$BICyan│        << LYNZ TUNNEL PROJECT >>        │$NC"       
echo -e "$BICyan└──────────────────────────────────────────┘${NC}"
echo -e "\033[1;97mLynzTunnel\e[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu



