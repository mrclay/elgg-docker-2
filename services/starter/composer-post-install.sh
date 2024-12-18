#!/bin/bash

set -exuo pipefail

mkdir -p web/vendor

# Composer copies these into root. We really need em in web.
mv index.php web/
mv install.php web/
mv upgrade.php web/

cp web-vendor-autoload.php web/vendor/autoload.php

# LOL thanks installer but nginx
rm .htaccess

# Fresh settings file
if [ ! -d elgg-config/settings.php ]; then
  cp elgg-config/docker.settings.php elgg-config/settings.php
fi;

chmod -R 0777 mod elgg-config

# Copy just these installer files into the public vendor
TMP=vendor/elgg/elgg/views/default/graphics
mkdir -p "web/${TMP}"
cp "${TMP}/elgg_logo.png" "web/${TMP}/"

TMP=vendor/npm-asset/jquery/dist
mkdir -p "web/${TMP}"
cp "${TMP}/jquery.min.js" "web/${TMP}/"
