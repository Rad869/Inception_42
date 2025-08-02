#!/bin/bash

mkdir -p /etc/nginx/tls

openssl req  -nodes -new -x509  \
    -keyout /etc/nginx/tls/server.key \
    -out /etc/nginx/tls/server.cert \
    -subj "/C=MG/ST=Tana/L=Tana/O=School/OU=Com/CN=rrabeari.42.fr"

mkdir -p /data/wordpress/
