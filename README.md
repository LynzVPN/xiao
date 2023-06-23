<font color="red"><b>Update Repo Khusus Debian 10 <br>
  
  ```html
apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot
  ```
  
Update Repo Khusus Ubuntu 18/20 <br>
  
  ```html
apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && reboot
 ```

Link Instalasi <br>

  ```html
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/LynzVPN/xiao/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```
