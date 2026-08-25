# Local Web Server Setup

## Start it

```
cd ~/docker/lamp

docker compose up -d --build
```

## Stop it

```
docker compose down
```


## Updating PHP / MariaDB

Change the version in the `.env`:

```
PHP_VERSION=8.5
MARIADB_VERSION=12
```

or

```
MARIADB_VERSION=latest
```

then

```
docker compose pull
docker compose up -d
```