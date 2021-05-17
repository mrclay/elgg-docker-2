#!/bin/bash

set -exuo pipefail

if [ ! -d core/Elgg ]; then
  mkdir -p core
  git clone git@github.com:Elgg/Elgg.git core/Elgg
fi
if [ ! -f core/Elgg/elgg-config/settings.php ]; then
  cp core/core-settings.php core/Elgg/elgg-config/settings.php
fi
if [ ! -f core/Elgg/.htaccess ]; then
  cp core/Elgg/install/config/htaccess.dist core/Elgg/.htaccess
fi

# Build the containers
docker-compose up -d

# Composer install
docker-compose exec -w /var/www/html/Elgg core-nginx composer install --ignore-platform-reqs

# Wait
docker-compose exec core-nginx /wait

# Installer
docker-compose exec core-nginx php cli-install.php

echo "Or from Apache: http://localhost:8082";
