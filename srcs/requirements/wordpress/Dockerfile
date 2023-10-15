FROM debian:buster

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y php php-fpm php-mysql mariadb-client && \
	mkdir /run/php && \
	apt-get install -y wget && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp.phar

COPY ./tools/config.sh .

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x ./config.sh

EXPOSE 9000

ENTRYPOINT ["./config.sh"]
