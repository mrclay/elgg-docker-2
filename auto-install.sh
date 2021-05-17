#!/bin/bash

set -exuo pipefail

# Build the containers
docker-compose up -d

# Composer install
docker-compose exec starter composer install --ignore-platform-reqs

# Wait
docker-compose exec starter /wait

# Installer
docker-compose exec starter php cli-install.php
