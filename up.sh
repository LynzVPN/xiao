#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
sleep 2
# hapus menu
rm -rf menu
rm -rf menu-trial
rm -rf menu-vmess
rm -rf menu-vless
rm -rf running
rm -rf clearcache
rm -rf menu-trgo
rm -rf menu-trojan
rm -rf fix
rm -rf menu-ssh
rm -rf usernew
rm -rf trial
rm -rf renew
rm -rf hapus
rm -rf cek
rm -rf member
rm -rf delete
rm -rf autokill
rm -rf ceklim
rm -rf tendang
rm -rf menu-set
rm -rf menu-domain
rm -rf add-host
rm -rf port-change
rm -rf certv2ray
rm -rf menu-webmin
rm -rf speedtest
rm -rf about
rm -rf auto-reboot
rm -rf restart
rm -rf bw
rm -rf port-ssl
rm -rf port-ovpn
rm -rf xp
rm -rf acs-set
rm -rf sshws
rm -rf status
rm -rf menu-backup
rm -rf backup
rm -rf restore
rm -rf jam
rm -rf up

# download script
cd /usr/bin
# menu
wget -O menu "https://raw.githubusercontent.com/LynzVPN/xiao/main/menu/menu.sh"
wget -O menu-trial "https://raw.githubusercontent.com/LynzVPN/xiao/main/menu/menu-trial.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/menu-vless.sh"
wget -O running "https://raw.githubusercontent.com/LynzVPN/xiao/main/banner/running.sh"
wget -O clearcache "https://raw.githubusercontent.com/LynzVPN/xiao/main/menu/clearcache.sh"
#wget -O menu-trgo "https://raw.githubusercontent.com/artanodrop/v4/main/menu/menu-trgo.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/menu-trojan.sh"
wget -O fix "https://raw.githubusercontent.com/LynzVPN/xiao/main/cf.sh"

# menu ssh ovpn
wget -O menu-ssh "https://raw.githubusercontent.com/LynzVPN/xiao/main/menu/menu-ssh.sh"
wget -O usernew "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/trial.sh"
wget -O renew "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/renew.sh"
wget -O hapus "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/hapus.sh"
wget -O cek "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/cek.sh"
wget -O member "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/member.sh"
wget -O delete "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/delete.sh"
wget -O autokill "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/tendang.sh"

# menu system
wget -O menu-set "https://raw.githubusercontent.com/LynzVPN/xiao/main/menu/menu-set.sh"
wget -O menu-domain "https://raw.githubusercontent.com/LynzVPN/xiao/main/menu/menu-domain.sh"
wget -O addhost "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/addhost.sh"
wget -O port-change "https://raw.githubusercontent.com/artanodrop/v4/main/port/port-change.sh"
wget -O genssl "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/genssl.sh"
wget -O menu-webmin "https://raw.githubusercontent.com/artanodrop/v4/main/menu/menu-webmin.sh"
wget -O speedtest "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/speedtest_cli.py"
wget -O about "https://raw.githubusercontent.com/LynzVPN/xiao/main/menu/about.sh"
wget -O auto-reboot "https://raw.githubusercontent.com/LynzVPN/xiao/main/menu/auto-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/artanodrop/v4/main/menu/restart.sh"
#wget -O clear-log "https://raw.githubusercontent.com/xlord-27/xiao/main/menu/clear-log.sh"
wget -O bw "https://raw.githubusercontent.com/artanodrop/v4/main/menu/bw.sh"

# change port
wget -O port-ssl "https://raw.githubusercontent.com/artanodrop/v4/main/port/port-ssl.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/artanodrop/v4/main/port/port-ovpn.sh"


wget -O xp "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/xp.sh"
wget -O acs-set "https://raw.githubusercontent.com/artanodrop/v4/main/acs-set.sh"

wget -O sshws "https://raw.githubusercontent.com/artanodrop/v4/main/ssh/sshws.sh"
wget -O status "https://raw.githubusercontent.com/artanodrop/v4/main/status.sh"
wget -O menu-backup "https://raw.githubusercontent.com/LynzVPN/xiao/main/menu/menu-backup.sh"
wget -O backup "https://raw.githubusercontent.com/LynzVPN/xiao/main/backup/backup.sh"
wget -O restore "https://raw.githubusercontent.com/LynzVPN/xiao/main/backup/restore.sh"
wget -O strt "https://raw.githubusercontent.com/LynzVPN/xiao/main/backup/strt.sh"
wget -O limitspeed "https://raw.githubusercontent.com/LynzVPN/xiao/main/backup/limitspeed.sh"
wget -O autobackup "https://raw.githubusercontent.com/LynzVPN/xiao/main/backup/autobackup.sh"
wget -O up "https://raw.githubusercontent.com/LynzVPN/xiao/main/up.sh"
wget -O jam "https://raw.githubusercontent.com/LynzVPN/xiao/main/jam.sh"
wget -O /usr/local/bin/xray "https://raw.githubusercontent.com/Rerechan02/XRAY/main/xray.linux.64bit"

#vmess
wget -O trial-ws "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/trial-ws.sh"
wget -O del-ws "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/del-ws.sh"
wget -O renew-ws "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/renew-ws.sh"
wget -O cek-ws "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/cek-ws.sh"
#vless
wget -O trial-vless "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/trial-vless.sh"
wget -O del-vless "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/del-vless.sh"
wget -O renew-vless "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/renew-vless.sh"
wget -O cek-vless "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/cek-vless.sh"

#trojan
wget -O trial-tr "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/trial-tr.sh"
wget -O del-tr "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/del-tr.sh"
wget -O renew-tr "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/renew-tr.sh"
wget -O cek-tr "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/cek-tr.sh"

#user log
wget -O show-trojan "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/show-trojan.sh"
wget -O show-vless "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/show-vless.sh"
wget -O show-vmess "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/show-vmess.sh"
wget -O show-ssh "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/show-ssh.sh"

#usage log
wget -O usage-trojan "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/usage-trojan.sh"
wget -O usage-vless "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/usage-vless.sh"
wget -O usage-vmess "https://raw.githubusercontent.com/LynzVPN/xiao/main/xray/usage-vmess.sh"
#percepat
wget -O tcp "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/tcp.sh"
#swapmemori
wget -0 kvmswap "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/kvmswap.sh"
#jajajs
wget -0 addxlord "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/addxlord.sh"
wget -0 log-ssh "https://raw.githubusercontent.com/LynzVPN/xiao/main/ssh/log-ssh.sh"

chmod +x menu
chmod +x menu-trial
chmod +x menu-vmess
chmod +x menu-vless
chmod +x running
chmod +x /usr/local/bin/xray
chmod +x clearcache
chmod +x menu-trgo
chmod +x menu-trojan
chmod +x fix

chmod +x menu-ssh
chmod +x usernew
chmod +x trial
chmod +x renew
chmod +x hapus
chmod +x cek
chmod +x member
chmod +x delete
chmod +x autokill
chmod +x ceklim
chmod +x tendang

chmod +x menu-set
chmod +x menu-domain
chmod +x addhost
chmod +x port-change
chmod +x genssl
chmod +x menu-webmin
chmod +x speedtest
chmod +x about
chmod +x auto-reboot
chmod +x restart
chmod +x bw

chmod +x port-ssl
chmod +x port-ovpn

chmod +x xp
chmod +x acs-set
chmod +x sshws
chmod +x status
chmod +x menu-backup
chmod +x backup
chmod +x restore
chmod +x strt
chmod +x limitspeed
chmod +x autobackup
chmod +x jam
chmod +x up
chmod +x trial-ws
chmod +x cek-ws
chmod +x renew-ws
chmod +x del-ws
chmod +x trial-vless
chmod +x cek-vless
chmod +x renew-vless
chmod +x del-vless
chmod +x trial-tr
chmod +x cek-tr
chmod +x renew-tr
chmod +x del-tr
chmod +x show-trojan
chmod +x show-ssh
chmod +x show-vless
chmod +x show-vmess
chmod +x usage-trojan
chmod +x usage-vless
chmod +x usage-vmess
chmod +x tcp
chmod +x swap
chmod +x log-ssh
chmod +x addxlord
chmod +x update
cd

echo -e " [INFO] Update Successfully"
sleep 2
exit
