FROM debian:bullseye

RUN apt update && \
    apt upgrade
RUN apt -y install wget
RUN apt install -y php7.4 php-phar php-json php-curl php-fpm php-mysqli php-iconv

RUN mkdir -p /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp
RUN chmod +x /usr/bin/wp
RUN wp core download --path=/var/www/wordpress --allow-root

WORKDIR /var/www/wordpress

COPY conf/wp-config.php /conf/wp-config
COPY tools/entrypoint.sh /tmp/entrypoint.sh

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]