#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
metadata=`curl http://169.254.169.254/latest/meta-data/network/interfaces/`
echo "<h2>WebServer with IP: $myip</h2><br>Build by Terraform!" > /var/www/html/index.html
echo "<h3>meta-data/network/interfaces: $metadata</h3>" >> /var/www/html/index.html

sudo service httpd start
chkconfig httpd on

