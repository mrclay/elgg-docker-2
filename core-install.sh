#!/bin/bash

set -exuo pipefail

if [ ! -d core/Elgg ]; then
  mkdir -p core
  git clone git@github.com:Elgg/Elgg.git core/Elgg
fi

# Build the containers
docker-compose up -d

# Composer install
docker-compose exec -w /var/www/html/Elgg core-nginx composer install --ignore-platform-reqs

# Wait
docker-compose exec core-nginx /wait

# Installer
docker-compose exec core-nginx php cli-install.php
