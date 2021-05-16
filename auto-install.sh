#!/bin/bash

set -exuo pipefail

# Build the containers
docker-compose up -d

# Wait
docker-compose exec elgg /wait

# Installer
docker-compose exec elgg php cli-install.php
