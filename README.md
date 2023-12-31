# **PROJET INCEPTION**

Ce projet vise à mettre en place une petite infrastructure de services [nginx, wordpress, mariadb]
en utilisant Docker [bonus : seveur ftp, page html, redis, adminer portainer],
le tout devant être exécuté sur une machine virtuelle.
Voici les principales directives :

**Fichiers et Répertoires :**

Tout le code source et les fichiers de configuration sont dans le dossier srcs.
Un Makefile est present à la racine du projet [all re bonus clean fclean rm-volumes]
Un fichier .env dans le dossier srcs doit etre present et stocker toutes les variables d'environnement nécessaires.


**Contenu du fichier .env :**

    MARIADB_ROOT_PASSWORD=
    MARIADB_DATABASE=
    MARIADB_USER=
    MARIADB_PASSWORD=
    WORDPRESS_ADMIN=
    WORDPRESS_ADMIN_PASSWORD=
    WORDPRESS_USER=
    WORDPRESS_USER_PASSWORD=
    WORDPRESS_ADMIN_EMAIL=
    WORDPRESS_USER_EMAIL=
    FTP_USER=
    FTP_PASS=



**Conteneurs et Services :**

Un conteneur NGINX utilisant uniquement TLSv1.2 ou TLSv1.3.
Un conteneur pour WordPress + php-fpm (sans NGINX).
Un conteneur pour MariaDB (sans NGINX).



**Volumes et Réseaux :**

Un volume pour la base de données de WordPress.
Un volume pour les fichiers du site WordPress.
Un réseau Docker pour connecter tous ces conteneurs.



**Sécurité et Performance :**

Pas de mot de passe en clair dans les Dockerfiles.
Utilisation de Debian pour les images de conteneur (Pas d'images de services officielles)



**Autres contraintes :**

Les conteneurs doivent redémarrer automatiquement en cas de crash.
Interdiction d'utiliser certaines méthodes de liaison entre conteneurs (comme --link ou network: host).



**Bonus :**

Un conteneur avec un serveur Redis pour le cache du site.
Un conteneur avec un serveur FTP qui pointe vers le volume Wordpress.
Un conteneur avec une simple page HTML qui l'envoie vers le conteneur Wordpress par FTP.
Un conteneur avec Adminer pour visualiser la base de donnee.
Un conteneur avec Portainer pour visualiser l'infrastructure docker.



**Domaine et Port :**

Le domaine doit pointer vers votre adresse IP locale ([login].42.fr)
et le seul point d'entrée doit être le port 443 sur le conteneur NGINX.

```bash
.
├── Makefile
├── README.md
└── srcs
    ├── docker-compose.yml
    └── requirements
        ├── bonus
        │   ├── adminer
        │   │   ├── Dockerfile
        │   │   └── tools
        │   │       └── config.sh
        │   ├── docker-compose-bonus.yml
        │   ├── ftp-server
        │   │   ├── conf
        │   │   │   └── vsftpd.conf
        │   │   ├── Dockerfile
        │   │   └── tools
        │   │       └── config.sh
        │   ├── portainer
        │   │   └── Dockerfile
        │   ├── redis
        │   │   └── Dockerfile
        │   └── website
        │       ├── Dockerfile
        │       └── tools
        │           ├── config.sh
        │           └── index.html
        ├── mariadb
        │   ├── conf
        │   │   └── 50-server.cnf
        │   ├── Dockerfile
        │   └── tools
        │       └── config.sh
        ├── nginx
        │   ├── conf
        │   │   └── nginx_custom.conf
        │   ├── Dockerfile
        │   └── tools
        └── wordpress
            ├── conf
            │   └── www.conf
            ├── Dockerfile
            └── tools
                └── config.sh
```