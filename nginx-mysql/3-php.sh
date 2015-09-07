#!/bin/bash

soft=php-5.6.13
softPkg=$soft.tar.gz

cd /root/soft

# install libmcrypt for php
wget http://nchc.dl.sourceforge.net/project/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz
tar zxvf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8
./configure
make
make install


# install php
yum -y install gcc gcc-c++  make cmake automake autoconf kernel-devel ncurses-devel libxml2-devel openssl-devel curl-devel libjpeg-devel libpng-devel  pcre-devel libtool-libs freetype-devel gd zlib-devel file bison patch mlocate flex diffutils   readline-devel glibc-devel glib2-devel bzip2-devel gettext-devel libcap-devel libmcrypt-devel openldap openldap-devellibxslt-devel

wget http://php.net/get/$softPkg/from/this/mirror
mv mirror $softPkg
tar zxvf $softPkg
cd /root/soft/$soft
mkdir -p /usr/local/php

./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --with-mysql=/usr/local/mysql --with-mysqli=/usr/local/mysql/bin/mysql_config --with-mysql-sock=/tmp/mysql.sock --with-pdo-mysql --with-freetype-dir --with-png-dir --with-jpeg-dir --with-zlib --with-gd --with-iconv --with-zlib --enable-xml --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --enable-fpm --enable-mbstring --enable-ftp --enable-gd-native-ttf --with-openssl --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-pear --with-gettext --enable-session --with-mcrypt --with-curl --disable-fileinfo
make
make install

cp php.ini-production /usr/local/php/etc/php.ini
rm -rf /etc/php.ini
ln -s /usr/local/php/etc/php.ini /etc/php.ini
cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
cp /root/soft/$soft/sapi/fpm/init.d.php-fpm /etc/rc.d/init.d/php-fpm
chmod +x /etc/rc.d/init.d/php-fpm
chkconfig php-fpm on


######################
# vi /usr/local/php/etc/php-fpm.conf
# user = www
# group = www
# pid = run/php-fpm.pid
#
#
# vi /usr/local/php/etc/php.ini
# date.timezone = PRC
# 
# 
######################

######################
#
# php-fpm∆Ù∂Ø /usr/local/php/sbin/php-fpm
# php-fpmÕ£÷π /etc/rc.d/init.d/php-fpm stop
# php-fpm÷ÿ∆Ù /etc/rc.d/init.d/php-fpm restart
# 
#
#
#
######################


