<?php

// Requires trailing slash.
define('BACKUP_DIR', '/mnt/restores/restore0/brick660/tangle004/gardens-sites/');
define('LIVE_DIR', '/mnt/files/tangle004/gardens-sites/');

$test = '';
if (!empty($argv[1]) && $argv[1] == 'help') {
  echo "Usage: cat /tmp/nids.txt | php {$argv[0]} [help|test]\n
        parameters:\n
        help - this page\n
        test - rsync with dry run\n";
  exit(0);
}
elseif (!empty($argv[1]) && $argv[1] == 'test') {
  // Will add the dry run flag and the verbose flag.
  $test = 'vn';
}

// Read nids from stdin.
$nids = array();
while ($nid = fgets(STDIN)) {
  $matches = array();
  if (1 == preg_match('/^g?([0-9]+)$/', trim($nid), $matches)) {
    $nid = $matches[1];
  }
  
  $nids[] = 'g' . $nid;
}

// Iterate over the nids and execute rsync.
foreach ($nids as $site_dir) {

  print "------------------------------- REPAIRING $site_dir ----------------------------------------\n";

  // If the directories exist, try rsyncing.
  if (is_dir(BACKUP_DIR . $site_dir) && is_dir(LIVE_DIR . $site_dir)) {

    // Rsync, ignoring newer updates and maintaining file meta data.
    $rsync_cmd = 'rsync -aruogt' . $test . ' --exclude=css_* --exclude=js_* ' . BACKUP_DIR . $site_dir . '/ ' . LIVE_DIR . $site_dir . '/';
    print "Executing $rsync_cmd\n";
    $rsync_out = system($rsync_cmd);
   
    if (!empty($test)) {
      print $rsync_out;
    }

    // If rsync ran, test for empty files 
    print "RSYNC DONE, SEARCHING FOR EMPTY FILES\n";
    $find_cmd = 'find ' . LIVE_DIR . $site_dir . '/. -name *.tpl.php -size 0';
    $find_out = system($find_cmd);

    if (!empty($find_out)) {
      print "[ERROR] empty files still exist: $find_out\n";
    }
  }
  else {
    print "$site_dir not found\n";
  }
  print "\n";
  print "\n";
}

print "DONE\n";
