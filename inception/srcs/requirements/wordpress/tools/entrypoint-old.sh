target="/etc/php/7.4/fpm/pool.d/www.conf"
socket="/run/php/php7.4-fpm.sock"

# Vérifiez si la configuration a déjà été effectuée
grep -E "listen = $socket" $target > /dev/null 2>&1
if [ $? -ne 0 ]; then
    sed -i "s|.*listen =.*|listen = $socket|g" $target
    echo "env[SQL_HOST] = \$SQL_HOST" >> $target
    echo "env[SQL_USER] = \$SQL_USER" >> $target
    echo "env[SQL_PASSWORD] = \$SQL_PASSWORD" >> $target
    echo "env[SQL_DATABASE] = \$SQL_DATABASE" >> $target
fi

if [ ! -f "wp-config.php" ]; then
    cp /conf/wp-config ./wp-config.php

    sleep 5

    wp core install --url="$WP_URL" \
                    --title="$WP_TITLE" \
                    --admin_user="$WP_ADMIN" \
                    --admin_password="$WP_ADMIN_PWD" \
                    --admin_email="$WP_ADMIN_EMAIL" \
                    --skip-email

    wp plugin update --all

    wp theme install astra --activate

    wp user create $WP_USER \
                    $WP_USER_EMAIL \
                    --role=editor \
                    --user_pass=$WP_USER_PWD
fi

php-fpm7.4 --nodaemonize
