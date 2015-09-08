#!/bin/bash

pwd=$(cd "$(dirname "$0")"; pwd)

$pwd/0-init.sh
$pwd/1-mysql.sh
$pwd/2-nginx.sh
$pwd/3-php.sh
