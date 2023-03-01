FROM php:8.1-fpm

RUN apt-get update

RUN apt-get install -y \
    git \
    zip \
    curl \
    sudo \
    unzip \
    supervisor \
    libxml2-dev \
    libicu-dev \
    libbz2-dev \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libreadline-dev \
    g++

RUN docker-php-ext-install \
    gd \
    bz2 \
    intl \
    iconv \
    bcmath \
    opcache \
    calendar \
    pdo_mysql \
    xml \
    zip \
    pdo \
    mysqli \
    sockets



RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Bucharest /etc/localtime
RUN "date"

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN apt-get install -y nodejs

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.mode=coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

ARG uid
ARG gid

RUN groupadd -g $gid laravel
RUN useradd -G www-data,root -u $uid -g $gid -d /home/laravel laravel
RUN usermod -a -G laravel www-data
RUN mkdir -p /home/laravel/.composer && \
    chown -R laravel:laravel /home/laravel && \
    su laravel

RUN chown -R laravel:laravel /home/laravel


WORKDIR /var/www/laravel
