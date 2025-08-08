FROM debian:bookworm

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    php-fpm \
    php-mysql \
    php-xml \
    php-gd \
    php-curl \
    php-zip \
    php-mbstring \
    curl && rm -rf /var/lib/apt/lists/*
    
RUN mkdir -p /data/www/

WORKDIR /data/www/

COPY ./wordpress/* .
COPY ./www.conf /etc/php/8.2/fpm/pool.d/www.conf

CMD [ "php-fpm8.2", "-F" ]

