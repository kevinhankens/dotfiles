<?php

$aliases['g'] = array(
  'root' => '/var/www/gardens_distro/docroot/',
  'uri' => 'http://gardens.localhost',
  'include' => array('/var/www/gardens_repos/gardens/hosting-drush/', '/var/www/aq/')
);

$aliases['wmg'] = array(
  'root' => '/var/www/gardens_repos/wmg/docroot/',
  'uri' => 'http://wmg.localhost',
  'include' => '/var/www/gardens_repos/wmg/hosting-drush/'
);

$aliases['gr'] = array(
  'root' => '/var/www/gardener/docroot',
  'uri' => 'http://gardener.localhost',
);

$aliases['dl'] = array(
  'root' => '/var/www/drupal',
  'uri' => 'http://drupal.localhost',
);


