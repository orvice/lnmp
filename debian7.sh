#!/bin/bash
#
# https://github.com/orvice/lnmp
# @orvice
# http://orvice.org
# orvice@gmail.com
# last update 2014-8-25


# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script "
    exit 1
fi

#Add MariaDB
# https://downloads.mariadb.org/mariadb/repositories/#mirror=osuosl&distro=Debian&distro_release=wheezy&version=5.5
apt-get install python-software-properties -y
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/5.5/debian wheezy main'

#Update
apt-get update
apt-get upgrade

#Install MariaDB
apt-get install mariadb-server -y

#Add Dotdeb
echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
cd /tmp
wget http://www.dotdeb.org/dotdeb.gpg 
apt-key add  dotdeb.gpg

#Update
apt-get update

#Remove Apache
apt-get remove -y apache2 apache2-doc apache2-utils apache2.2-common apache2.2-bin apache2-mpm-prefork apache2-doc apache2-mpm-worker  

#Install Nginx
apt-get install -y nginx-full -y

#Install PHP 
apt-get install php5-fpm php5-gd php5-mysql php5-memcache php5-curl memcached -y

#Start Nginx
service nginx start

#Add group&user: www and mysql
groupadd www
useradd -s /sbin/nologin -M -g www www
groupadd mysql
useradd -s /sbin/nologin -M -g mysql mysql

#Add dir
mkdir /homw/www
mkdir /home/www/default
chown www:www /home/www -R
