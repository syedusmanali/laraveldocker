FROM php:7.4-fpm

RUN apt-get update
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions mysqli gd ssh2 zip imagick exif xdebug && \
     apt update && apt install telnet iputils-ping default-mysql-client -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ARG USER_ID
ENV USER_ID "$USER_ID"

RUN useradd -m laraveldockeruser -u $USER_ID

WORKDIR /var/www/laravel-docker-codebase
RUN chown -R laraveldockeruser:laraveldockeruser /var/www/laravel-docker-codebase

ADD custom_conf.ini  /usr/local/etc/php/conf.d/

COPY xdebug_remote.txt /usr/local/etc/php/conf.d/xdebug_remote.txt
RUN cat /usr/local/etc/php/conf.d/xdebug_remote.txt >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#Adding docker entrypoint
ADD entrypoint.sh /opt/
RUN chmod 755 /opt/entrypoint.sh

CMD ["/bin/bash","/opt/entrypoint.sh"]

USER laraveldockeruser