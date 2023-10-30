#!/bin/bash

# Démarrage de MariaDB
mysqld_safe --datadir=/var/lib/mysql &

# Attente que le serveur MariaDB soit prêt
while ! mysqladmin ping -h "$MYSQL_HOST" --silent; do
    sleep 1
done

# Exécution des commandes SQL pour configurer la base de données
mysql -u root -p"$SQL_ROOT_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO $SQL_USER@'%';
FLUSH PRIVILEGES;
EOF

# Arrêt du serveur MariaDB
mysqladmin -p"$SQL_ROOT_PASSWORD" shutdown

# Lancement du serveur MariaDB en mode normal
exec mysqld
