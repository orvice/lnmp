#!/bin/bash
#
# https://github.com/orvice/lnmp
# @orvice
# htpp://orvice.org
# orvice@gmail.com
# last update 2014-5-20




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


