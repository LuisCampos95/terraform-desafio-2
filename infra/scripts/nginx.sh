#!/bin/bash
sudo su
sudo yum update
sudo amazon-linux-extras install nginx1.12 -y
sudo systemctl start nginx

echo "events{}
http {
   upstream backend {
      server 192.168.4.10:3001; 
      server 192.168.5.11:3002;
      server 192.168.6.12:3003;
   }

   server {
      listen 8080;
      listen 80;
      location / {
         proxy_pass http://backend;
      }
   }
}" > /etc/nginx/nginx.conf

sudo systemctl restart nginx
sudo yum install nmap -y