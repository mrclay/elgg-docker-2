<?php

// none of the following may be empty
$params = [
  // database parameters
  'dbuser' => getenv('MYSQL_USER'),
  'dbpassword' => getenv('MYSQL_PASSWORD'),
  'dbname' => getenv('MYSQL_DATABASE'),
  'dbhost' => getenv('MYSQL_HOST'),
  'dbport' => getenv('MYSQL_PORT') ? : '3306',

  // site settings
  'sitename' => 'Sample Elgg Site',
  'siteemail' => 'fake@example.com',
  'wwwroot' => getenv('ELGG_WWWROOT'),
  'dataroot' => getenv('ELGG_DATAROOT'),

  // admin account
  'displayname' => 'Admin',
  'email' => getenv('ELGG_ADMIN_EMAIL'),
  'username' => getenv('ELGG_ADMIN_USER'),
  'password' => getenv('ELGG_ADMIN_PASSWORD'),
];

if (PHP_SAPI !== 'cli') {
  echo "You must use the command line to run this script.";
  exit;
}

require_once __DIR__ . '/vendor/autoload.php';

$installer = new ElggInstaller();
$installer->batchInstall($params);

echo "Your site is available at: " . getenv('ELGG_WWWROOT') . "\n";
