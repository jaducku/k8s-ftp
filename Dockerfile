FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

COPY vsftpd.conf /etc/vsftpd.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# FTP 디렉토리 생성
RUN mkdir -p /datas && \
    mkdir -p /var/run/vsftpd/empty

EXPOSE 20 21 21100-21110

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]