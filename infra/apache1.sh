#!/bin/bash
sudo yum update httpd
sudo yum install httpd -y
echo 'Servidor Apache 1' > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl status httpd

sudo yum install nmap -y

sed -i 's/80/3001/g' /etc/httpd/conf/httpd.conf

sudo su
echo "ServerTokens Prod" >> /etc/httpd/conf/httpd.conf
echo "ServerSignature Off" >> /etc/httpd/conf/httpd.conf

sudo systemctl restart httpd

# nmap -sV 192.168.1.237