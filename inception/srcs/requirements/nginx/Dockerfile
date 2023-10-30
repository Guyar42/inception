FROM    debian:bullseye

RUN	apt update && \
    apt upgrade -y && \
    apt install nginx openssl -y

RUN	mkdir -p /etc/nginx/ssl /var/run/nginx

RUN openssl req -x509 -nodes \
      -out /etc/nginx/ssl/guyar.42.fr.crt \
      -keyout /etc/nginx/ssl/guyar.42.fr.key \
      -subj "/C=FR/ST=Rhone/L=Lyon/O=42/OU=42/CN=guyar.42.fr/UID=guyar/emailAddress=guyar@student.42lyon.fr"

COPY conf/nginx.conf /etc/nginx/http.d/default.conf
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
