#!/bin/bash
sudo yum update httpd
sudo yum install httpd -y
echo -e '
<html>
    <body>
        <h1>Apache Server 1</h1>
    </body>
</html>' > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl status httpd