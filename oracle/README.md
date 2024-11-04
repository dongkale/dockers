# Docker

# https://hub.docker.com/r/gvenzl/oracle-xe

## Quick Start

Run a new database container (data is removed when the container is removed, but kept throughout container restarts):

```
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=<your password> gvenzl/oracle-xe
```

Run a new persistent database container (data is kept throughout container lifecycles):

```
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=<your password> -v oracle-volume:/opt/oracle/oradata gvenzl/oracle-xe
```

Run a new persistent 11g R2 database container (volume path differs in 11g R2):

```
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=<your password> -v oracle-volume:/u01/app/oracle/oradata gvenzl/oracle-xe:11
```

Reset database SYS and SYSTEM passwords:

```
docker exec <container name|id> resetPassword <your password>
```

## work

```
docker run -d -p 1521:1521 -e ORACLE_PASSWORD=password -v oracle-volume:/opt/oracle/oradata gvenzl/oracle-xe
```

## volume folder

```
\\wsl$\docker-desktop-data\data\docker\volumes
```

## composer 설정

```
version: "3.8"

services:
  oracle-db:
    image: gvenzl/oracle-xe
    container_name: oracle-db
    ports:
      - "1521:1521"
    environment:
      - ORACLE_PASSWORD=password
    volumes:
      - oracle-db-data:/opt/oracle/oradata
    restart: always
volumes:
  oracle-db-data:
    driver: local

```

## composer 실행

```
docker-compose up -d
```
