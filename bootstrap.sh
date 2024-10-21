#!/bin/bash
yum update -y
yum install httpd.x86_64 -y
systemctl start httpd
systemctl enable httpd
echo '<!DOCTYPE html>' > /var/www/html/index.html
echo '<html lang="en">' >> /var/www/html/index.html
echo '<body style="background-color:black;">' >> /var/www/html/index.html
echo '  <h1 style="color:white;">Welcome to the Apache landing page, Coalfire!</h1>' >> /var/www/html/index.html
echo '</body>' >> /var/www/html/index.html
echo '</html>' >> /var/www/html/index.html