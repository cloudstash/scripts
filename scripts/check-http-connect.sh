#!/bin/sh

function check_status_url {
    res=`curl -s -I $1 | grep HTTP/1.1 | awk {'print $2'}`
    if [ $res -ne 200 ]
    then
        echo "Site $1 in status $res then php-fpm will be restart... \n"
        /etc/init.d/php-fpm restart
    fi
}

check_status_url http://www.taldom.org