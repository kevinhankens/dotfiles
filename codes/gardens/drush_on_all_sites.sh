#!/bin/bash

HOME=`pwd`

# Make sure that the user is in the correct directory.
echo -n "You are currently in $HOME, do you wish to continue? [Y,n]: "
read CONTINUE

# Allow them to bail out.
if [[ "$CONTINUE" = "y" || "$CONTINUE" = "Y" || "$CONTINUE" = "" ]]; then
  echo "Continued"
else
  echo "Terminated."
  exit 0
fi

for SITE in `ls -1`; do
  if [[ $SITE == www.* ]]; then
    cd $SITE
    EN=`drush scr /mnt/tmp/wmg_301_drush`
    echo $SITE "--" $EN
    cd $HOME
  fi
done

