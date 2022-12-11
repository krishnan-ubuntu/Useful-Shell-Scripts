#!/bin/sh

#Check if user running this script is root, if not stop execution and print error

if [[ $USER != "root" ]]; then
	echo "This script should be executed as root"
	exit -1 #-1 returns error here
fi

# Update the packages

apt update


# Install apache web server

apt -y install apache2


# Install mysql server

apt -y install mysql-server


# Install php and other required packages

apt -y install php libapache2-mod-php php-mysql


# Getting php version for future commands

CURRENT_VERSION=$(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".")


# Installing memcached

apt-get -y install memcached


# Installing php memcached package

apt-get -y install php"$CURRENT_VERSION"-memcached


# Installing php xml package

apt-get install php"$CURRENT_VERSION"-xml


# Restart apache

systemctl restart apache2


# Now we will configure php-fpm to ensure the application performance is faster


# Stopping apache

systemctl stop apache2


# Disabling php 7.4

a2dismod php"$CURRENT_VERSION"


# Disabling mpm_prefork module.

a2dismod mpm_prefork


# Enabling mpm_event. This module increases the speed and performance of apache

a2enmod mpm_event


# Installing php-fpm

apt -y install php-fpm


# Installing mod-fcgid, it is a faster alternate to mod_cgi

apt -y install libapache2-mod-fcgid


# Enabling required php configuration for fpm

a2enconf php"$CURRENT_VERSION"-fpm


# Enabling proxy

a2enmod proxy


# Enabling proxy_fcgi

a2enmod proxy_fcgi


# Restart apache server

systemctl restart apache2


# shutdown the server and exit without error

shutdown now;exit
