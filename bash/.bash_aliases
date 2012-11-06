alias lf='ls -lha'
alias cpr='cp -pPr'
alias grr='grep -ir'
alias dsql='mysql -uroot -p'
alias spokes='cd /var/www/spokes'
alias dsqldump='mysqldump -uroot -p'
alias ap2='sudo /etc/init.d/apache2'
alias ifr='cd /var/www/ifr/docroot/sites/all/modules/custom/'
alias ifrroot='cd /var/www/ifr/docroot'
alias phpini='sudo vim /etc/php5/apache2/php.ini'
alias cleangrind='sudo rm /tmp/cachegrind.out.*'
alias suspend='sudo pm-suspend'
alias psg='ps aux | grep'

# Statsd
alias statstestg='echo -n "kevin.dev.gauge:600|g"  | nc -w 1 -u 127.0.0.1 8125'
alias statstestc='echo -n "kevin.dev.counter:900|c"  | nc -w 1 -u 127.0.0.1 8125'
alias carbonstart='sudo /opt/graphite/bin/carbon-cache.py start &'
alias carbonstop='cat /opt/graphite/storage/carbon-cache-a.pid | sudo xargs kill -9'
alias carbonrestart='cat /opt/graphite/storage/carbon-cache-a.pid | sudo xargs kill -9 && carbonstart'
alias carbonstartdebug='sudo /opt/graphite/bin/carbon-cache.py --debug start &'

# Gardens
alias drush='/var/www/gardens/drush5/drush'
alias getsiteutest='drush @g getsite --theme-files-only --stage=utest --db-username=root --db-password= '
alias getsitewmg='drush @g getsite --theme-files-only --stage=wmg-egardens --db-username=root --db-password= '
alias getsitefpmg='drush @g getsite --theme-files-only --stage=fpmg-egardens --db-username=root --db-password= '
alias getsitepfi='drush @g getsite --theme-files-only --stage=enterprise-g1 --db-username=root --db-password= '
alias clear_varnish='curl -X PURGE -H "X-Acquia-Purge: SITENAME" -H "Accept-Encoding: gzip" '

alias dg='drush @g'
alias dgr='drush @gr'
alias cdg='cd /var/www/gardens'
alias cdgr='cd /var/www/gardener'

alias gsinfo='drush @g gs-site-info --user=khankens'

alias ssha='ssh -A -p40506'
alias sshb=' ssh -A -p40506 -i ~/.ssh/bastion_rsa'

# Jump to the first web node on atangles
# master master.e.gardens.f.e2a.us
alias sshgm='ssh -A -p40506 master.e.gardens.f.e2a.us'
alias sshg1='ssh -A -p40506 managed-47.gardens.hosting.acquia.com'  # tangle001
alias sshg2='ssh -A -p40506 managed-52.gardens.hosting.acquia.com'  # tangle002
#alias sshtangle003
alias sshg4='ssh -A -p40506 managed-89.gardens.hosting.acquia.com'  # tangle004
alias sshg5='ssh -A -p40506 managed-140.gardens.hosting.acquia.com' # tangle005
alias sshg6='ssh -A -p40506 managed-159.gardens.hosting.acquia.com' # tangle006
alias sshg7='ssh -A -p40506 managed-182.gardens.hosting.acquia.com' # tangle007
alias sshg8='ssh -A -p40506 managed-203.gardens.hosting.acquia.com' # tangle007
