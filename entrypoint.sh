#!/bin/bash

# ConfigMap에서 환경 변수를 가져옴
FTP_USER=${USER}
FTP_PASSWORD=${PASSWORD}

# FTP 사용자 생성 및 기본 디렉토리 설정
useradd -m -d /datas -s /bin/bash ${FTP_USER}
echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd
chown ${FTP_USER}:${FTP_USER} /datas

# vsftpd 실행
exec "$@"