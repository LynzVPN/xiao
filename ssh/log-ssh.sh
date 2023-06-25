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
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m            LOG CREATE SSH ACCOUNT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m            USERNAME EXP DATE               \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
while read expired
do
IP=$(curl -sS ifconfig.me)
user=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
PASSWD=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
domain=`cat /etc/xray/domain`
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$pass\n$pass\n"|passwd $user &> /dev/null
hariini=`date -d "0 days" +"%Y-%m-%d"`

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/ssh/${LOGIN}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${LOGIN}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${LOGIN}\b/d" /etc/ssh/.ssh.db
fi
done < /etc/passwd
echo""
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo""
read -rp "Input Username : " user

CLIENTS_EXISTS=$(grep -c -E "^### " "/etc/ssh/.ssh.db")
if [[ ${CLIENTS_EXISTS} == '0' ]]; then
clear
echo " Failure User Not Found"
else
echo -e "`cat "/etc/ssh/log-ssh-$user.txt"`"
fi
echo""
read -n 1 -s -r -p "tekan enter untuk kembali"
menu
