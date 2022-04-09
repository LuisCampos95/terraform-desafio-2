#!/bin/bash
# sudo yum update -y
sudo amazon-linux-extras install nginx1.12 -y
sudo systemctl start nginx

sudo su
echo "events{}
http {
   upstream backend {
      server 192.168.4.10:3001; 
      server 192.168.5.11:3002;
      server 192.168.6.12:3003;
   }

   server {
      location / {
         proxy_pass http://backend;
      }
   }
}" > /etc/nginx/nginx.conf

sudo systemctl restart nginx