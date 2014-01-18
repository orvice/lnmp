#!/bin/bash

#Add Dotdeb
echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
wget http://www.dotdeb.org/dotdeb.gpgcat dotdeb.gpg | apt-key add -


#Add MariaDB
apt-get install python-software-properties
apt-key adv –recv-keys –keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
add-apt-repository ‘deb http://mirror.jmu.edu/pub/mariadb/repo/5.5/debian wheezy main’

apt-get update

#Install Nginx
apt-get install -y nginx-full

#Install MariaDB
apt-get install mariadb-server