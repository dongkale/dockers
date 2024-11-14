First, create a few volumes so that state is persisted across restarts:

```sh
docker volume create nats1
docker volume create nats2
docker volume create nats3
```

Now create a `docker-compose.yaml` with the following:

```
version: '3.9'
services:
  nats1:
    image: docker.io/nats:2.9.20
    ports:
      - "4222:4222"
      - "8222:8222"
    volumes:
      - nats1:/data
    command:
      - "--name=nats1"
      - "--cluster_name=c1"
      - "--cluster=nats://nats1:6222"
      - "--routes=nats-route://nats1:6222,nats-route://nats2:6222,nats-route://nats3:6222"
      - "--http_port=8222"
      - "--js"
      - "--sd=/data"

  nats2:
    image: docker.io/nats:2.9.20
    ports:
      - "4223:4222"
      - "8223:8222"
    volumes:
      - nats2:/data
    command:
      - "--name=nats2"
      - "--cluster_name=c1"
      - "--cluster=nats://nats2:6222"
      - "--routes=nats-route://nats1:6222,nats-route://nats2:6222,nats-route://nats3:6222"
      - "--http_port=8222"
      - "--js"
      - "--sd=/data"

  nats3:
    image: docker.io/nats:2.9.20
    ports:
      - "4224:4222"
      - "8224:8222"
    volumes:
      - nats3:/data
    command:
      - "--name=nats3"
      - "--cluster_name=c1"
      - "--cluster=nats://nats3:6222"
      - "--routes=nats-route://nats1:6222,nats-route://nats2:6222,nats-route://nats3:6222"
      - "--http_port=8222"
      - "--js"
      - "--sd=/data"

volumes:
  nats1:
    external: true
  nats2:
    external: true
  nats3:
    external: true
```

Start the cluster:

```
docker-compose up -d
```

It should be possible to target the cluster locally:

```
nats -s localhost:4222 stream ls
No Streams defined
```

## Test

nats sub -s "nats://127.0.0.1:4222" hello &

nats pub -s "nats://127.0.0.1:4222" hello world_4222
nats pub -s "nats://127.0.0.1:4222" hello world_4222
nats pub -s "nats://127.0.0.1:4222" hello world_4222

nats pub -s "nats://127.0.0.1:4222,nats://127.0.0.1:4222,nats://127.0.0.1:4222" whole_world

docker kill nats-server-02-nats1-1

docker-compose stop nats1

docker kill nats-server-02-nats2-1

docker kill nats2-1
