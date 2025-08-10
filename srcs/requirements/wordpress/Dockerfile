# FROM debian:bookworm

# RUN apt update && \
#     apt upgrade -y && \
#     apt install -y \
#     php-fpm \
#     php-mysql \
#     mariadb-client \
#     curl
    
# RUN mkdir -p /data/www/rrabeari.42.fr

# # WORKDIR /data/www/rrabeari.42.fr


# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp
# COPY ./script.sh /data/www/script.sh

# RUN chmod +x /data/www/script.sh


# CMD [ "/data/www/script.sh" ]

# # CMD [ "php-fpm8.2", "-F" ]
# # ENTRYPOINT [ "/bin/bash", "/data/www/script.sh" ]




FROM debian:bookworm

# Install PHP, MariaDB client, curl, and unzip
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    php-fpm \
    php-mysql \
    mariadb-client \
    curl \
    unzip \
    less \
    bash && \
    rm -rf /var/lib/apt/lists/*

# Create directory for WordPress
RUN mkdir -p /data/www/rrabeari.42.fr

# Set working directory
WORKDIR /data/www/rrabeari.42.fr

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copy PHP-FPM configuration
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Copy setup script
COPY ./script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

# Run script on container start
ENTRYPOINT ["bash", "/usr/local/bin/script.sh"]
