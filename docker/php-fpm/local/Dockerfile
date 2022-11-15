FROM php:8.1-fpm

# Change hour
RUN cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime
RUN echo "Europe/Madrid" > /etc/timezone

# RUN add-apt-repository ppa:openjdk-r/ppa
# Install docker extensions and set script permissions
RUN mkdir -p /usr/share/man/man1
RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get update
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y zip
RUN apt-get clean

# Install xDebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.mode=debug,coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host = host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Download and install composer
RUN curl --silent --show-error https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /var/www
