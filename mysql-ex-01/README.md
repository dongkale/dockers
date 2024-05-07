- https://github.com/lagoon-io/mysql8-docker-container/blob/master/docker-compose.yml
- https://tychejin.tistory.com/393
- https://github.com/docker-library/mysql/issues/302
- https://github.com/bitnami/containers/blob/main/bitnami/mysql/docker-compose.yml
- https://nstgic3.tistory.com/entry/%EB%8F%84%EC%BB%A4%EB%A1%9C-MySQL-%EC%8B%A4%ED%96%89-composeyml-%EB%9C%AF%EC%96%B4%EB%B3%B4%EA%B8%B0
- https://velog.io/@gingaminga/Docker-compose%EB%A1%9C-MySQL-%EC%8B%A4%ED%96%89%ED%95%98%EA%B8%B0
- https://pyrasis.com/jHLsAlwaysUpToDateDocker/Unit08/02
- https://velog.io/@songs4805/docker-compose%EB%A5%BC-%ED%99%9C%EC%9A%A9%ED%95%98%EC%97%AC-MySQL-%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0

docker run -d --name mysql-docker -v mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=test mysql:latest

- https://stackoverflow.com/questions/67164445/mysql-container-wont-start-failed-to-initialize-dd-storage-engine

이것은 나를 위해 일했고 mysql 버전의 도커 서비스가 업그레이드 된 후에이 오류가 발생했습니다.

docker-compose down -v - 실행 중인 모든 서비스 및 볼륨을 중지하고 제거합니다.
docker system prune --volumes - 볼륨과 캐시를 완전히 제거합니다.
docker-compose up -d - 서비스를 다시 끌어오고 만듭니다.
