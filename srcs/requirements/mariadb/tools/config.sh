#!/bin/bash

DATABASE="/var/lib/mysql/$MARIADB_DATABASE"

mysql_secure_install()
{
	mysql -uroot<<EOF
	UPDATE mysql.user SET Password = PASSWORD('$MARIADB_ROOT_PASSWORD') WHERE User = 'root';
	DROP DATABASE IF EXISTS test;
	DELETE FROM mysql.user WHERE User='';
	DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
	FLUSH PRIVILEGES;
EOF
}

create_database()
{
	mysql -uroot<<EOF
	CREATE DATABASE $MARIADB_DATABASE;
	CREATE USER IF NOT EXISTS $MARIADB_USER IDENTIFIED BY '$MARIADB_PASSWORD';
	GRANT ALL ON $MARIADB_DATABASE.* TO $MARIADB_USER;
	FLUSH PRIVILEGES;
	QUIT
EOF
}

main()
{
	echo Starting mysql service...
	service mysql start
	if [ ! -d $DATABASE ]; then
		echo Mysql_secure_install
		mysql_secure_install
		echo secure install done.
		echo Create database...
		create_database
		echo Database created
		service mysql stop
		echo Execute mysqld
		exec mysqld_safe
	else
		echo Database exist.
		service mysql stop
		echo Execute mysqld
		exec mysqld_safe
	fi
}

main
