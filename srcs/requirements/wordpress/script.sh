# #!/bin/bash

# set -e  # Exit if any command fails

# WP_PATH="/data/www/rrabeari.42.fr"

# # Download WordPress core
# wp core download --path="$WP_PATH" --allow-root
# chown -R www-data:www-data /data/www
# chmod -R 755 /data/www

# # Wait until MariaDB is ready
# # echo "Waiting for MariaDB to be ready..."
# # until mysqladmin ping -h "mariadb" --silent; do
# #     sleep 2
# # done

# # Create wp-config.php
# wp config create \
#   --path="$WP_PATH" \
#   --dbname=mydb \
#   --dbhost=mariadb \
#   --dbuser=wordpress \
#   --dbpass=wordpress \
#   --allow-root

# # Install WordPress
# wp core install \
#   --path="$WP_PATH" \
#   --url="rrabeari.42.fr" \
#   --title="Test coucou" \
#   --admin_user=testFull \
#   --admin_password=myPass \
#   --admin_email=example@gmail.com \
#   --allow-root

# # Create extra user
# wp user create myuser myuser@gmail.com \
#   --path="$WP_PATH" \
#   --role=author \
#   --user_pass=myuser \
#   --allow-root

# php-fpm8.2 -F



#!/bin/bash
set -e

WP_PATH="/data/www/rrabeari.42.fr"

echo "Running WordPress setup script..."

# Download WordPress if not already present
if [ ! -f /data/www/rrabeari.42.fr/wp-config.php ]; then
    wp core download --allow-root
    wp config create --path=$WP_PATH --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root
    wp core install --path=$WP_PATH --url=$WP_URL --title="Inception" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
    wp user create $WP_USER $WP_USER_MAIL --path=$WP_PATH  --role=author --user_pass=$WP_USER_PASS --allow-root
fi

echo "Starting PHP-FPM..."
php-fpm8.2 -F
