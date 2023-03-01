FROM nginx:latest

COPY /docker/nginx/vhosts /etc/nginx/conf.d

RUN sed -i "s:PHP_PORT:9000:g" /etc/nginx/conf.d/default.conf
RUN sed -i "s:LARAVELPHP:laravel-php:g" /etc/nginx/conf.d/default.conf

ARG uid
ARG gid

RUN groupadd -g $gid laravel
RUN useradd -G www-data,root -u $uid -g $gid -d /home/laravel laravel
RUN usermod -a -G laravel www-data
RUN mkdir -p /home/laravel/.composer && \
    chown -R laravel:laravel /home/laravel

WORKDIR /var/www/laravel
