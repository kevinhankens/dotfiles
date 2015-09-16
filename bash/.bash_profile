
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.bash_aliases

alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/\1/'"
export PS1='\[\033[01;36m\]\h\[\033[00m\]:\W (\[\033[01;33m\]$(__git_ps1)\[\033[00m\]) '

export PATH="$PATH:/Applications/MAMP/bin:/Applications/MAMP/Library/bin"
export PATH="$PATH:/Users/khankens/.composer/vendor/bin/"

export GARDENS_GITTOOLS="/Users/khankens/Acquia/tools/gittools"

if [ -f ~/git-completion.bash ]; then
  . ~/git-completion.bash
fi

export PATH=$PATH:/usr/local/go/bin
export GOPATH=/Users/khankens/go
export PATH=$PATH:/Users/khankens/go/bin
export PATH=$PATH:/Users/khankens/go/src/github.com/acquia/statsgod/_vendor/bin
export PATH=$PATH:/Users/khankens/go/src/github.com/mitchellh/packer/bin

export ACQUIA_GIT_ACCOUNT_EMAIL="kevin.hankens@acquia.com"
export ACQUIA_GIT_ACCOUNT_NAME="kevinhankens"

# Development configuration
export SECURE=/Volumes/Secure
export EC2_ACCOUNT=hosting-dev

HOSTING_ALIASES=~/Acquia/www/fields/hosting_aliases
RUBYLIB=~/Acquia/www/fields/aq/lib/
test -f "${HOSTING_ALIASES}" && . "${HOSTING_ALIASES}"
export AQ_LOG_LEVEL=debug
# Somehow necessary because I don't have a prod user?
export AH_SSH_USER=ahlauncher
export FIELDS_SSH_USER=ahlauncher
export FIELDS_SSH_ID=ahlauncher

# on OS X we can use java_home to find Java
#JAVA_HOME="$(/usr/libexec/java_home -v 1.6)"
JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export PATH=$PATH:/usr/local/src/apache-maven-3.3.3/bin

export RUBYLIB=$RUBYLIB:/Users/khankens/Acquia/PlatformHealth/nemesis-puppet/lib:/Users/khankens/Acquia/PlatformHealth/nemesis/lib
export PATH=$PATH:/Users/khankens/Acquia/PlatformHealth/nemesis-puppet/bin:/Users/khankens/Acquia/PlatformHealth/nemesis/bin

function docker-init()
{
  /usr/local/bin/docker-start
  eval "$(docker-machine env default)"
}

function docker-ip()
{
  docker-machine ip default
}

function aws-init()
{
  AWSDIR="/Volumes/Secure/ec2/$1/acquia-aws"
  test -f $AWSDIR && source $AWSDIR
}

# AWS
export AWS_DATA_PATH=/usr/local/aws//lib/python2.7/site-packages/botocore/data

# nemesis
function nem()
{
  cd /Users/khankens/Acquia/Darwin/nemesis
  bundle exec bin/nemesis "$@"
  cd -
}
