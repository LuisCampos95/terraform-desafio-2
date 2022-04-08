#!/bin/bash
sudo su
sudo yum update httpd
sudo yum install httpd -y
echo 'Servidor Apache 2' > /var/www/html/index.html
sudo systemctl start httpd

sudo yum install nmap -y

sed -i 's/80/3002/g' /etc/httpd/conf/httpd.conf

echo "ServerTokens Prod" >> /etc/httpd/conf/httpd.conf
echo "ServerSignature Off" >> /etc/httpd/conf/httpd.conf

sudo systemctl restart httpd

# nmap -sV 192.168.1.237