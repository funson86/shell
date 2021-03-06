#!/bin/bash

soft=git-1.9.4
softPkg=$soft.tar.gz

yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker wget

# install git 
mkdir -p /root/soft
cd /root/soft/
wget https://www.kernel.org/pub/software/scm/git/$softPkg
tar zxvf $softPkg
cd $soft

make prefix=/usr/local/git all
make prefix=/usr/local/git install
echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc
source /etc/bashrc


######################
# 
# git --version
# git clone https://github.com/funson86/shell
# git remote -v
# 
######################

# git config core.filemode false  #git pull时本地文件如果不是644，则提示本地文件修改了，linux下忽略本地文件权限变化 
