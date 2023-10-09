FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install mariadb-server mariadb-client -y \
	&& apt-get clean - y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/config.sh .

#RUN chmod 755 config.sh && mkdir /run/mysqld && chmod 755 /run/mysqld

#ENV /inception/srcs/.env

RUN chmod 755 ./config.sh && chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

#ENV MARIADB_ROOT_PASSWORD=qwerty12345
#ENV MARIADB_DATABASE=wp_database
#ENV MARIADB_USER=axfernan
#ENV MARIADB_PASSWORD=qwerty

#VOLUME ~/data/DB

#verifier si mysqld existe deja (relance des containers) ==> execution directe
#secure installation (script)
#creer une base de donnee wp
#creer utilisateur + droits
ENTRYPOINT ["./config.sh"]

#CMD ["mysqld"]
#CMD ["bash"]
