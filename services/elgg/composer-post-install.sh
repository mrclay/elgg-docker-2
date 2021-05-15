#!/bin/bash

set -exuo pipefail

mv index.php web/
mv install.php web/
mv upgrade.php web/

chmod -R 0777 mod

rm .htaccess

if [ ! -d elgg-config/settings.php ]; then
  cp elgg-config/docker.settings.php elgg-config/settings.php
fi;
