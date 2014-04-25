#!/bin/bash

#https://github.com/orvice/lnmp





#Add MariaDB

apt-key adv –recv-keys –keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
add-apt-repository ‘deb http://mirror.jmu.edu/pub/mariadb/repo/5.5/debian wheezy main’

#Update
apt-get update
apt-get upgrade



#Install MariaDB
apt-get install python-software-properties -y
apt-get install mariadb-server -y


