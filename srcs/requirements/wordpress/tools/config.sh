#!/bin/bash

WP_FOLDER=/var/www/html

wp_installation()
{
	echo wp core download:
	wp.phar core download --allow-root --path=$WP_FOLDER
	chmod -R 755 /var/www/html
	chown -R www-data:www-data /var/www/html
	echo wp config create
	wp.phar config create --allow-root --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb_container --path=$WP_FOLDER
	echo wp core install
	wp.phar core install --allow-root --url="$USER.42.fr" --admin_user=$WORDPRESS_ADMIN --title="my website" --admin_email=$WORDPRESS_ADMIN_EMAIL --admin_password=$WORDPRESS_ADMIN_PASSWORD --path=$WP_FOLDER
	echo user create
	wp.phar user create --allow-root $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=author --path=$WP_FOLDER
	echo -e WORDPRESS installed and configured !
}

sleep 5

if [ ! -f "/var/www/html/index.php" ]; then
	echo Wordpress installation
	wp_installation
else
	echo Wordpress already installed and configured !
fi

exec php-fpm7.3 -F
