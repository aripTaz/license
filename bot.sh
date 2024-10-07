#!/bin/bash
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
clear
wget https://javatunnel.my.id/botpins/requirements.txt
pip3 install -r requirements.txt

clear
sleep 1

cat > /etc/systemd/system/konek.service << END
[Unit]
Description=backend
After=network.target

[Service]
WorkingDirectory=/usr/bin/
ExecStart=python3 -m itil 0.0.0.0 aripin
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl enable konek
systemctl start konek 
systemctl restart konek
cd /root

sleep 2
clear
echo -e ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[92mInstallations complete, Api Server Aktivit\033[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "Press !! [ ENTER ] Back To Menu"
menu