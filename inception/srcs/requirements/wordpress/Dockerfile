FROM debian:bullseye

RUN apt update && \
    apt install curl -y && \
    apt install -y mariadb-client && \
    apt install php-mysql -y && \
    apt install php-fpm -y

RUN mkdir -p /var/www/wordpress /run/php

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp
RUN chmod +x /usr/bin/wp
RUN wp core download --path=/var/www/wordpress --allow-root

WORKDIR /var/www/wordpress

COPY conf/wp-config.php /conf/wp-config
COPY tools/entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]