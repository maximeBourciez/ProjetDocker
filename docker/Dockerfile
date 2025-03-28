FROM nginx:latest

# Installer les outils nécessaires
RUN apt-get update && apt-get install -y \
    php-fpm \
    php \
    php-mysqli \
    php-xml \
    php-mbstring 

# Configuration Nginx
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Configuration PHP-FPM dynamique
RUN PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;") && \
    mkdir -p /etc/php/${PHP_VERSION}/fpm/pool.d && \
    mkdir -p /run/php

COPY docker/php/php-fpm.conf /etc/php/${PHP_VERSION}/fpm/php-fpm.conf
COPY docker/php/www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf

COPY db-wait.sh /usr/local/bin/db-wait.sh
RUN chmod +x /usr/local/bin/db-wait.sh


EXPOSE 80 81

COPY src/ /var/www/

COPY startup.sh ./startup.sh

CMD ["sh", "startup.sh"]