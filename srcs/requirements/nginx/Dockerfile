FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install nginx -y && apt install openssl -y
COPY ./tools/generate_certificate.sh /myScript/generate_certificate.sh
RUN /bin/bash /myScript/generate_certificate.sh
RUN rm -rf /etc/nginx/sites-enabled/default
COPY ../conf/default /etc/nginx/sites-enabled/default
EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]