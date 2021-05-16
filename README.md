# Elgg docker-compose Project

## Auto install

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
docker-compose exec elgg composer <COMMAND>
docker-compose exec elgg composer show

docker-compose exec elgg vendor/elgg/elgg/elgg-cli <COMMAND>
docker-compose exec elgg vendor/elgg/elgg/elgg-cli plugins:list
```

### Browse elgg-data

```
# Quick look
docker-compose exec -w /var/data/elgg-data elgg tree

# Browse
docker-compose exec -w /var/data/elgg-data elgg bash
```

### Viewing mail sent

http://localhost:8025/
