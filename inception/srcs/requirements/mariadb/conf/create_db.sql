-- Crée la base de données
CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;

-- Crée un utilisateur et attribue des privilèges
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';
GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';

-- Actualise les privilèges
FLUSH PRIVILEGES;

-- Change le mot de passe de l'utilisateur 'root'
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');
