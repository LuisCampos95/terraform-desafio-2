#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install nginx1.12 -y
sudo systemctl start nginx
sudo su

echo 
"http {
   upstream backend {
      server 192.168.4.0:3001; 
      server 192.168.5.0:3002;
      server 192.168.6.0:3003;
   }

   # This server accepts all traffic to port 80 and passes it to the upstream. 
   # Notice that the upstream name and the proxy_pass need to match.

   server {
      listen 8080; 

      location / {
          proxy_pass http://backend;
      }
   }
}" >> /etc/nginx/conf.d/loadbalancer.conf

sudo systemctl restart nginx