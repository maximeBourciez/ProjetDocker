#!/bin/sh

PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;") && \
mkdir -p /var/log/php /run/php && \
touch /var/log/php/php-fpm.log && \
chown -R www-data:www-data /var/log/php /run/php && \

# Démarrer PHP-FPM
php-fpm${PHP_VERSION} -D && \

chmod 777 -R /run/php/php8.2-fpm.sock; \
chmod 777 -R /var/www/backend/bootstrap/cache; \
chmod 777 -R /var/www/backend/storage; \

# Attendre que MySQL soit prêt avant de migrer
sleep 5; \

cd /var/www/backend; \
php artisan migrate:fresh --force; \
sleep 5; \
php artisan db:seed --force; \

# Démarrer Nginx
nginx -g "daemon off;"
