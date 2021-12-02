#!/bin/bash

if [ ! -f .nodump ] ; then
    echo "Dumping DB: ";
    #we put password in clear to assure this is does not work in production env
    cat ops/mysql/db_dump.sql | mysql -u root --password="secret" -h mysql laraveldocker --connect-timeout=1
    touch .nodump
    echo "OK";
else
    echo "Not loading dumps"
fi

composer install

php-fpm