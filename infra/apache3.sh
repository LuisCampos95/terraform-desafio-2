#!/bin/bash
sudo su
sudo yum update httpd
sudo yum install httpd -y
sudo systemctl start httpd
echo '<h1>Servidor Apache 3</h1>' > /var/www/html/index.html
echo "ServerTokens Prod" >> /etc/httpd/conf/httpd.conf
echo "ServerSignature Off" >> /etc/httpd/conf/httpd.conf

sed -i 's/80/3003/g' /etc/httpd/conf/httpd.conf

echo "# Decrease TIME_WAIT seconds
net.ipv4.tcp_fin_timeout = 30
# Recycle and Reuse TIME_WAIT sockets faster
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_tw_reuse = 1" >> /etc/sysctl.conf

systemctl restart httpd

sudo yum install nmap -y