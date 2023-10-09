FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl \
	&& mkdir -p /etc/nginx/ssl && apt-get clean -y
RUN openssl genpkey -algorithm RSA -out /etc/nginx/ssl/private.key
RUN openssl req -new -key /etc/nginx/ssl/private.key -out /etc/nginx/ssl/cert.csr -subj "/C=FR/ST=ALPES MARITIMES/L=NICE/O=42/OU=NC/CN=NC/"
RUN openssl x509 -req -days 365 -in /etc/nginx/ssl/cert.csr -signkey /etc/nginx/ssl/private.key -out /etc/nginx/ssl/certificate.cert

COPY ./conf/nginx_custom.conf /etc/nginx/conf.d/nginx_custom.conf

CMD ["nginx", "-g", "daemon off;"]
