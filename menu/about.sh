#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
aureb=$(cat /home/re_otm)
clear
echo " "
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          SERVICE PORT INFORMATION          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "\033[0m  >Port SSH Websocket       :80\e[0m"
echo -e "\033[0m  >Port SSH Websocket SSL   :443\e[0m"
echo -e "\033[0m  >Port SSH SSL             :447,777\e[0m"
echo -e "\033[0m  >Port OpenSSH             :22\e[0m"
echo -e "\033[0m  >Port SSH Dropbear        :109,143\e[0m"
echo -e "\033[0m  >Port Xray None TLS       :80\e[0m"
echo -e "\033[0m  >Port Xray TLS            :443\e[0m"
echo -e "\033[0m  >Port Vmess None TLS      :80\e[0m"
echo -e "\033[0m  >Port Vmess TLS           :443\e[0m"
echo -e "\033[0m  >Port Vmess GRPC          :443\e[0m"
echo -e "\033[0m  >Port Vless None TLS      :80\e[0m"
echo -e "\033[0m  >Port Vless TLS           :443\e[0m"
echo -e "\033[0m  >Port Vless GRPC          :443\e[0m"
echo -e "\033[0m  >Port Trojan WS           :443\e[0m"
echo -e "\033[0m  >Port Trojan GRPC         :443\e[0m"
echo -e "\033[0m  >Port ShadowSocks WS      :443\e[0m"
echo -e "\033[0m  >Port ShadowSocks GRPC    :443\e[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m                LYNZ TUNNELING              \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu



