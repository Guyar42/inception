FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade
RUN apt-get -y install wget
RUN apt-get install -y php7.3 php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

COPY conf/wp-config-sample.php /var/www/wordpress/wp-config-sample.php

# le CLI pour parametrer la config de php.
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#lui donner les drotis, et le placer dans les binaires.
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN /usr/sbin/php-fpm7.3 -F
#copy de auto config dans le contenaier
# COPY /conf/auto_config.sh /var/www/wordpress