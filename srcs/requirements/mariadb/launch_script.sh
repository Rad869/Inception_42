#!/bin/bash
set -e

# Start MariaDB without networking (background) for initialization
mysqld_safe --skip-networking &
sleep 2

# Set root password and create database/user if not initialized
if [ ! -d "/var/lib/mysql/${MARIADB_DATABASE}" ]; then
    echo "Initializing database..."
    mysql -u root <<-EOSQL
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
        FLUSH PRIVILEGES;
        CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
        CREATE OR REPLACE USER '${DB_USER_NAME}'@'localhost' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';;
        GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${DB_USER_NAME}'@'localhost' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';
        FLUSH PRIVILEGES;
EOSQL

    # mysql -u root -p"${MARIADB_ROOT_PASSWORD}" < /data/init.sql
fi


# Shutdown temp server
mysqladmin -uroot -p"${MARIADB_ROOT_PASSWORD}" shutdown

# Start MariaDB in foreground (so Docker container stays alive)
exec mysqld_safe
