#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
sleep 10
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    mkdir -p /var/www/wordpress

    wp core download  --path="/var/www/wordpress" --allow-root

    cd /var/www/wordpress

    wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=$SQL_HOST --path="/var/www/wordpress" --allow-root

    wp core install --url=$WP_DOMAIN/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --path="/var/www/wordpress" --allow-root
   
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --path="/var/www/wordpress" --allow-root
   
fi

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf



mkdir -p /run/php
/usr/sbin/php-fpm7.4 --nodaemonize