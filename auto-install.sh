#!/bin/bash

set -exuo pipefail

# Build the containers
docker-compose up -d

# Composer install
docker-compose exec elgg-starter composer install --ignore-platform-reqs

# Wait
docker-compose exec elgg-starter /wait

# Installer
docker-compose exec elgg-starter php cli-install.php
