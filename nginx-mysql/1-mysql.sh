#!/bin/bash

soft=mysql-5.6.26
softPkg=$soft.tar.gz


# install mysql 
groupadd mysql
useradd -g mysql mysql -s /bin/false
mkdir -p /data/mysql
chown -R mysql:mysql /data/mysql
mkdir -p /usr/local/mysql

cd /root/soft/
wget http://mirrors.sohu.com/mysql/MySQL-5.6/$softPkg
tar zxvf $softPkg
cd $soft

cmake . -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/data/mysql -DSYSCONFDIR=/etc
make
make install
cd /usr/local/mysql
cp ./support-files/my-default.cnf /etc/my.cnf

cp ./support-files/mysql.server /etc/rc.d/init.d/mysqld
chmod 755 /etc/init.d/mysqld
chkconfig mysqld on

ln -s /usr/local/mysql/lib/mysql /usr/lib/mysql
ln -s /usr/local/mysql/include/mysql /usr/include/mysql
ln -s /tmp/mysql.sock /var/lib/mysql/mysql.sock

######################
# vi /etc/my.cnf in [mysqld] section
# datadir = /data/mysql 
# Then go to /usr/local/mysql and execute
# cd /usr/local/mysql
# ./scripts/mysql_install_db --user=mysql #Generate mysql system database
# 
#
# vi /etc/rc.d/init.d/mysqld #edit
# basedir = /usr/local/mysql #MySQL installation path
# datadir = /data/mysql #MySQl database data path
# 
# 
######################

######################
#
# mysql start: service mysqld start
# mysql stop: service mysqld stop
# mysql restart: service mysqld restart
#
# /usr/local/mysql/bin/mysqladmin -u root -p password "123456" #change root password
#
#
#
######################
