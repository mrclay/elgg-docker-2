#!/bin/bash

set -exuo pipefail

if [ ! -d services/elgg-core/Elgg ]; then
  git clone git@github.com:Elgg/Elgg.git services/elgg-core/Elgg
fi

# Build the containers
docker-compose up -d

# Composer install
docker-compose exec -w /var/www/html/Elgg elgg-core composer install --ignore-platform-reqs

# Wait
docker-compose exec elgg-core /wait

# Installer
docker-compose exec elgg-core php cli-install.php
