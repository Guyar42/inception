FROM    debian:bullseye

RUN	apt update && apt install nginx -y
RUN	apt install vim -y
RUN	apt install curl -y
RUN	mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

# root principle
RUN chmod 755 /var/www/html
# uttilisateur principal
RUN chown -R www-data:www-data /var/www/html 


CMD [ "nginx", "-g", "daemon off;" ]
#CMD lance l'executable principale