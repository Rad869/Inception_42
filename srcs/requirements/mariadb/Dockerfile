FROM debian:bookworm

RUN apt update && apt upgrade -y && \
    apt install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /data

COPY launch_script.sh ./
COPY launch_script.sh /var/lib/mysql/launch_script.sh
RUN chmod +x launch_script.sh

ENTRYPOINT ["./launch_script.sh"]
