#!/bin/bash
set -e

# Start MariaDB without networking (background) for initialization
mysqld_safe --skip-networking &
sleep 2

# Set root password and create database/user if not initialized
if [ ! -d "/var/lib/mysql/${MARIADB_DATABASE}" ]; then
    echo "Initializing database..."
    mysql -u root -p"${MARIADB_ROOT_PASSWORD}"<<-EOSQL
        CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
        CREATE USER IF NOT EXISTS '${DB_USER_NAME}'@'%';
        GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${DB_USER_NAME}'@'%';
        FLUSH PRIVILEGES;
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
        FLUSH PRIVILEGES;
EOSQL

    # mysql -u root -p"${MARIADB_ROOT_PASSWORD}" < /data/init.sql
fi


# Shutdown temp server
mysqladmin -uroot -p"${MARIADB_ROOT_PASSWORD}" shutdown

# Start MariaDB in foreground (so Docker container stays alive)
exec mysqld_safe
