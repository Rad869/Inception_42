FROM debian:bookworm

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

RUN mkdir -p /data/www/rrabeari.42.fr

WORKDIR /data/www/rrabeari.42.fr

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY ./script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

ENTRYPOINT ["bash", "/usr/local/bin/script.sh"]
