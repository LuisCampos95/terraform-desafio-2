#!/bin/bash
sudo yum update httpd
sudo yum install httpd -y
echo 'Servidor Apache 3' > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl status httpd