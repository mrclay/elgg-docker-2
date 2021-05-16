# Elgg docker-compose Project

## Auto install

This installs Elgg into a new composer project so that port 8080 serves just the
contents of the `services/elgg-starter/web` directory. Composer's `vendor` is not
public.

```
./auto-install.sh
```

Open http://localhost:8080/

### Manual install

```
docker-compose up -d
docker-compose exec elgg-starter composer install --ignore-platform-reqs
```

Browse to http://localhost:8080/install.php

### Using composer / elgg-cli

```
docker-compose exec elgg-starter composer <COMMAND>
docker-compose exec elgg-starter composer show

docker-compose exec elgg-starter vendor/elgg/elgg/elgg-cli <COMMAND>
docker-compose exec elgg-starter vendor/elgg/elgg/elgg-cli plugins:list
```

### Browse elgg-data

```
# Quick look
docker-compose exec -w /var/data/elgg-data elgg-starter tree

# Browse
docker-compose exec -w /var/data/elgg-data elgg-starter bash
```

## Elgg/Elgg core install

This clones the Elgg repo into `services/elgg-core/Elgg` and installs it so
port 8081 serves the Elgg directory directly. Hence /vendor is public
(not recommended).

```
./core-install.sh
```

### Using composer / elgg-cli and elgg-data

```
docker-compose exec -w /var/www/html/Elgg elgg-core composer show

docker-compose exec elgg-core php Elgg/elgg-cli plugins:list

docker-compose exec -w /var/data/elgg-data elgg-core tree
```

## Viewing mail sent

http://localhost:8025/
