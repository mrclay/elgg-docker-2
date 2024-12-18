#!/bin/bash

set -exuo pipefail

docker compose down -v
git clean -xdf
rm -rf core/Elgg
