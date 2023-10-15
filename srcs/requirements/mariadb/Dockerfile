FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server mariadb-client -y \
	&& apt-get clean - y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/config.sh .

RUN chmod 755 ./config.sh && chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["./config.sh"]

