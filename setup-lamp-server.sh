#!/bin/sh

#Check if user running this script is root, if not stop execution and print error

sudo apt update
sudo apt -y install apache2
sudo apt -y install mysql-server
#sudo mysql_secure_installation
sudo apt -y install php libapache2-mod-php php-mysql
sudo systemctl stop apache2
sudo a2dismod php7.4
sudo a2dismod mpm_prefork
sudo a2enmod mpm_event
sudo apt -y install php-fpm
sudo apt -y install libapache2-mod-fcgid
sudo a2enconf php7.4-fpm
sudo a2enmod proxy
sudo a2enmod proxy_fcgi
sudo apachectl configtest
sudo systemctl restart apache2
shutdown -r now;exit