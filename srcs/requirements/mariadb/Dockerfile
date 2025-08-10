FROM debian:bookworm

RUN apt update && apt upgrade -y && \
    apt install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data

COPY launch_script.sh ./
COPY launch_script.sh /var/lib/mysql/launch_script.sh
RUN chmod +x launch_script.sh
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


ENTRYPOINT ["./launch_script.sh"]
