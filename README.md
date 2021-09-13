# Elgg docker-compose Project

## Auto install

This installs Elgg into a new composer project so that port 8080 serves just the
contents of the `services/starter/web` directory. Composer's `vendor` is not
public.

```
./auto-install.sh
```

Open http://localhost:8080/ and log in with `admin` / `Adm1npwd`

### Manual install

```
docker-compose up -d
docker-compose exec starter composer install --ignore-platform-reqs
```

Browse to http://localhost:8080/install.php

### Using composer / elgg-cli

```
docker-compose exec starter composer <COMMAND>
docker-compose exec starter composer show

docker-compose exec starter vendor/elgg/elgg/elgg-cli <COMMAND>
docker-compose exec starter vendor/elgg/elgg/elgg-cli plugins:list
```

### Accessing elgg-data

```
# Data tree
docker-compose exec -w /var/data/elgg-data starter tree

# Clear cache
docker-compose exec -w /var/data/elgg-data starter rm -rf caches/*

# Browse
docker-compose exec -w /var/data/elgg-data starter bash
```

## Elgg/Elgg core install

This clones the Elgg repo into `core/Elgg` and installs it so the Elgg
directory is the document root (/vendor is public, not recommended).

```
./core-install.sh
```

- http://localhost:8081/ - Elgg served by nginx
- http://localhost:8082/ - Elgg served by apache

### Using composer / elgg-cli and elgg-data

```
docker-compose exec -w /var/www/html/Elgg core-nginx composer show

docker-compose exec core-nginx php Elgg/elgg-cli plugins:list

# Data tree
docker-compose exec -w /var/data/elgg-data core-nginx tree

# Clear cache
docker-compose exec -w /var/data/elgg-data core-nginx rm -rf caches/*
```

## Viewing mail sent

http://localhost:8025/
