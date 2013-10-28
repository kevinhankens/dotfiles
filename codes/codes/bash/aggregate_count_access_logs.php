<?php

$access = file('/var/log/sites/tangle006/logs/managed-159/access.log');

$sites = array();
foreach($access as $line) {
  preg_match('/[^v]host=(.*)\.drupalgardens/', $line, $matches);
  if (isset($matches[1]) && isset($sites[$matches[1]])) {
    $sites[$matches[1]]['count']++;
  }
  else {
    $sites[$matches[1]] = array('site' => $matches[1], 'count' => 1);
  }
}

uasort($sites, 'sortu');

$count = 0;
foreach ($sites as $site) {
 print $site['site'] . "\t\t" . $site['count'] . "\n";
  $count++;
  if ($count > 10) break;
}

function sortu($a, $b) {
    if ($a['count'] == $b['count']) {
        return 0;
    }
    return ($a['count'] > $b['count']) ? -1 : 1;
}

