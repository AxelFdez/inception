# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: axfernan <axfernan@student.42nice.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/09 10:24:24 by axfernan          #+#    #+#              #
#    Updated: 2023/10/15 08:32:30 by axfernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

export USER_HOME = $(shell eval echo ~$(SUDO_USER))
export USER = $(shell echo $$SUDO_USER)

all: check-env
	@if ! grep -qx "127.0.0.1\t$(USER).42.fr" /etc/hosts; then \
		echo "127.0.0.1\t$(USER).42.fr" >> /etc/hosts; \
	fi
	@mkdir -p $(USER_HOME)/data/DB $(USER_HOME)/data/WORDPRESS
	@if ! grep -qx "USER=$(USER)" ./srcs/.env; then \
		echo "\nUSER=$(USER)\n" >> ./srcs/.env; \
	fi
	@if [ -f $(USER_HOME)/data/WORDPRESS/index.html ]; then \
		rm $(USER_HOME)/data/WORDPRESS/index.html; \
	fi
	@docker-compose -f ./srcs/docker-compose.yml up

check-env :
	@if [ ! -f srcs/.env ]; then \
		echo "need .env file in srcs directory."; \
		exit 1; \
	fi

clean:
	-@docker-compose -f ./srcs/docker-compose.yml down
	-@docker-compose -f ./srcs/requirements/bonus/docker-compose-bonus.yml down

fclean : clean rm-volumes
	-@docker rmi debian:buster nginx:v1 mariadb:v1 wordpress:v1 ftp-server:v1 website:v1 redis:v1 adminer:v1 portainer:v1

rm-volumes:
	-@rm -rf $(USER_HOME)/data/*
	-@docker volume rm DB
	-@docker volume rm WORDPRESS

re: clean all

bonus: clean check-env
	@if ! grep -q "127.0.0.1\t$(USER).42.fr" /etc/hosts; then \
		echo "127.0.0.1\t$(USER).42.fr" >> /etc/hosts; \
	fi
	@mkdir -p $(USER_HOME)/data/DB $(USER_HOME)/data/WORDPRESS
	@if ! grep -q "USER=$(USER)" ./srcs/.env; then \
		echo "USER=$(USER)" >> ./srcs/.env; \
	fi
	@docker-compose -f ./srcs/requirements/bonus/docker-compose-bonus.yml up

.PHONY : check-env all clean fclean rm-volumes re bonus