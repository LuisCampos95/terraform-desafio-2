#!/bin/bash
sudo su
sudo yum update
sudo amazon-linux-extras install nginx1.12 -y
sudo systemctl start nginx

ssh-keygen -t rsa -f /home/oracle/.ssh/id_rsa -q -P ""
echo "-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn
NhAAAAAwEAAQAAAYEAyQfkStg20Zw7d37Sfnpeh0BogeaGCkIWwsQctaQIRfIMHUjQs/VC
8rH/J9zTWenQtlldgigKHwh9DAIdwrBfcT/do77SGajrGGNC+mmBbAfFPtfJw4Kpyn3fA7
IBazSmDLpKCUGrF188CaXUdtA6wgLorfL+rs/tXRhDCD40AZslkhclxflAtTc7yG7Xlx7h
IiXmd5vHr0qBVS8OaOjA6T0bjgOJhWUuleydiFtfSK8IEk1szi9XAOU7f1eR3Sr4iyhKIj
sdfjw2J5j2Sa63tj2j3//CQAauXnm72ZzpYSwbw9pQ19x1ggaAHsw7XJQFehzWxH/mkQHx
aqBjzTxP6XVfC9lFXnHimkAvybMD/lAmv2DLhGwWeQPkIGJvmtItut9dvj98Dq5y5Q1qGX
mSJ6lmRh+SEh92w2t562WZ9ZIle8X9bOFxKF7Vp+2sjh+V4OLNCUmqxiEMm2j9S7Qo+Fkw
zRI5gBx9JTtgpO4Cdcf49yqm1+p9vsHe6FwTF8L5AAAFiNjujJnY7oyZAAAAB3NzaC1yc2
EAAAGBAMkH5ErYNtGcO3d+0n56XodAaIHmhgpCFsLEHLWkCEXyDB1I0LP1QvKx/yfc01np
0LZZXYIoCh8IfQwCHcKwX3E/3aO+0hmo6xhjQvppgWwHxT7XycOCqcp93wOyAWs0pgy6Sg
lBqxdfPAml1HbQOsIC6K3y/q7P7V0YQwg+NAGbJZIXJcX5QLU3O8hu15ce4SIl5nebx69K
gVUvDmjowOk9G44DiYVlLpXsnYhbX0ivCBJNbM4vVwDlO39Xkd0q+IsoSiI7HX48NieY9k
mut7Y9o9//wkAGrl55u9mc6WEsG8PaUNfcdYIGgB7MO1yUBXoc1sR/5pEB8WqgY808T+l1
XwvZRV5x4ppAL8mzA/5QJr9gy4RsFnkD5CBib5rSLbrfXb4/fA6ucuUNahl5kiepZkYfkh
IfdsNreetlmfWSJXvF/WzhcShe1aftrI4fleDizQlJqsYhDJto/Uu0KPhZMM0SOYAcfSU7
YKTuAnXH+Pcqptfqfb7B3uhcExfC+QAAAAMBAAEAAAGBAKLXWK7j66vpcSY/vgSj3TSUEN
PAxy1CEavdLiBY6ja2dee21xAfCQcM9lH1B+Maim1bgGpxQpmWx6xVfoP5WKalBEWiyg/t
C9rqdRPhKOw4cyePpqlPi3gyc9dLdui/cg53TIepAQ1ioIB0KuG/lQkZUB+v6WvzlCPIBm
yD7p6qbUmkpH10hV0Fi9C1MMACTH3b049pydwNbyxwfKywdau5SzvDU7+RkaXyUD1nPozi
85fXzd5K7KAWEBb7+XT9W3zifcUEyftF/d0E8r761k8lFB8mKHop+SOFvwH4jtP6S7/6BM
EmBBkJbjQzLAPn3H+CRPcXvou2aSSVZiMJML3p7bkFTjQ7vhYWUsEOkDr5tgrgPGYjZPP7
UE286hBKZ8v9uXnRw12gWPmDz2V9p/o1NTZqZo7xtst0AC0ZGz9Tp+0/DymzVUQyXO13yv
BJ0+y7puQVHt8kkLOC8lSlSLRigTuPYuzkCM+hy+BzpX9DMWDBFXAX+KkPgZC5VPHgsQAA
AMAByZHr665EAddCTg/nvfWUW2Z2Og3WoHveUDNjrGa3ri141FvrkHWMNqvb4MjVD9A48Z
Idsn5kJmUGVwzvFWNtTdzlBgt8wcwNMMa2cvQTetObmVHn0g0OH+6vDw4LMLHX99VaCTUC
tLYKQRNZU6iumTwcviAUz4J4mPoFpHA631XXPNJkRhuYPLbU5uSwSwufr+1aGSDVRqwjlV
PLEakmrhvozauMghpzdgF0IGQfFcQqkYd6wamh+K7J9aj6YLQAAADBAPQWiiCbFJ8v0emu
TtHeVs5Qs8pwqUq6h7dIY9OqIayt9By0oMm6BKYkOw4kPCAz0kGLZ+AzlmT/B6GToFTtQ6
qKMkW6b39rYino8yYvcgeHmD6NLU/o9ABpOWEiWrxU0nvh7qapUaCv7BF8kR2lkirLeJZR
RNuB1fa2O02epDqPDQx7Rdbu29lhtYNTn3SU6WhPjvemgGx0+XJPAPnDiYPi/f9fHyBUUn
T0+nVXee/nI6LEsz1q5HmHSQTN9fRlvQAAAMEA0tdtIhTG7SiTvIMHjB4lXFGhY3ExCgCL
wmGbf3KXML4tPF0qGLOEiw4hy/dJ4l5gFK6OsqARckggxNjX7v9wIQbnm7kPbpvcRSt4fu
qLKXh6V+JagOD2D5zDZzHO/RH89EkfQbymwqy7stBga6z4lhMO6MEC9VSbD3HEsIKmldU0
miNIjxLOSnFypKsP66AJDRV79Y/hoksiKYrCk0iZRj09VwGLaqHYeG4eJksAlWIjtNJ7EK
vLyJit8290lY/tAAAAEmx1aXNmQERFU0tUT1AtTFVJUw==
-----END OPENSSH PRIVATE KEY-----" > /home/ec2-user/.ssh/id_rsa

chmod 400 /home/ec2-user/.ssh/id_rsa
chown ec2-user:ec2-user /home/ec2-user/.ssh/id_rsa

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