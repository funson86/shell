#!/bin/bash

soft=mysql-5.6.26
softPkg=$soft.tar.gz


cd /root/soft

# install cmake for mysql
wget http://www.cmake.org/files/v2.8/cmake-2.8.8.tar.gz
tar zxvf cmake-2.8.8.tar.gz
cd cmake-2.8.8
./configure
make
make install



# install mysql 
groupadd mysql
useradd -g mysql mysql -s /bin/false
mkdir -p /data/mysql
chown -R mysql:mysql /data/mysql
mkdir -p /usr/local/mysql

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
# vi /etc/my.cnf #编辑配置文件,在 [mysqld] 部分增加
# datadir = /data/mysql #添加MySQL数据库路径
# 然后到/usr/local/mysql下执行
# cd /usr/local/mysql
# ./scripts/mysql_install_db --user=mysql #生成mysql系统数据库
# 
#
# vi /etc/rc.d/init.d/mysqld #编辑　
# basedir = /usr/local/mysql #MySQL程序安装路径
# datadir = /data/mysql #MySQl数据库存放目录
# 
# 
######################

######################
#
# mysql启动 service mysqld start
#
# /usr/local/mysql/bin/mysqladmin -u root -p password "123456" #修改密码　　
#
#
#
######################
