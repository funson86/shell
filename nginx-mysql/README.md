vi /usr/local/nginx/conf/nginx.conf #编辑配置文件,需做如下修改
user www www; #首行user去掉注释,修改Nginx运行组为www www；必须与/usr/local/php/etc/php-fpm.conf中的user,group配置相同，否则php运行出错
index index.php index.html index.htm; #添加index.php
# pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
location ~ \.php$ {
root html;
fastcgi_pass 127.0.0.1:9000;
fastcgi_index index.php;
fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
include fastcgi_params;
}
#取消FastCGI server部分location的注释,并要注意fastcgi_param行的参数,改为
$document_root$fastcgi_script_name,或者使用绝对路径
/etc/init.d/nginx restart #重启nginx
