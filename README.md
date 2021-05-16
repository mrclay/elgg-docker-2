# Elgg docker-compose Project

## Install

```
docker-compose up -d && docker-compose logs -f
```

Once the logs quiet down:

1. **ctrl+c** to detach from logger
1. Browse to http://localhost:8080/install.php

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
