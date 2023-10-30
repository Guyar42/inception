FROM    debian:bullseye

RUN	apt update && \
    apt upgrade -y && \
    apt install nginx openssl -y

RUN	mkdir -p /etc/nginx/ssl /var/run/nginx

RUN		openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
		-keyout /etc/nginx/ssl/guyar.42.fr.key \
		-out /etc/nginx/ssl/guyar.42.fr.crt \
		-subj "/C=FR/ST=Rhone/L=Lyon/O=42/CN=guyar.42.fr/emailAddress=guyar@student.42lyon.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 443

CMD		nginx -g "daemon off;"
