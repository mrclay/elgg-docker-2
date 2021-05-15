# Elgg docker-compose Project

## Install

```
docker-compose up -d && docker-compose logs -f
```

Once the logs quiet down:

1. **ctrl+c** to detach from logger
1. Browse to http://localhost:8080/install.php

### Using composer

```
docker-compose exec elgg composer <COMMAND>
```

### Browse elgg-data

```
docker-compose exec -w /var/data/elgg-data elgg bash
```
