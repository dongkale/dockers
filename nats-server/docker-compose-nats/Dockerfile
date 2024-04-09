# Dockerfile.nats

# NATS 서버를 실행할 기본 이미지 설정
FROM nats:latest

# NATS 서버를 실행할 포트 설정
EXPOSE 4222
EXPOSE 8222

# 사용자 정의 구성 파일 복사
COPY nats.conf /etc/nats/nats.conf

# NATS 서버 실행
CMD ["nats-server", "--config", "/etc/nats/nats.conf"]
