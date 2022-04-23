#!/bin/bash
sudo su
sudo yum update
sudo yum install httpd -y
sudo systemctl start httpd

echo "ServerTokens Prod" >> /etc/httpd/conf/httpd.conf
echo "ServerSignature Off" >> /etc/httpd/conf/httpd.conf

sed -i 's/Test Page for the Apache HTTP Server/Servidor Apache 1/g' /usr/share/httpd/noindex/index.html
sed -i 's/Test Page/Servidor Apache 1/g' /usr/share/httpd/noindex/index.html
sed -i 's/80/3001/g' /etc/httpd/conf/httpd.conf

echo "# Decrease TIME_WAIT seconds
net.ipv4.tcp_fin_timeout = 30
# Recycle and Reuse TIME_WAIT sockets faster
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_tw_reuse = 1" >> /etc/sysctl.conf

sudo sysctl -p
systemctl restart httpd
sudo yum install nmap -y