# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]|\[\033[01;34m\]\W\[\033[00m\] $(__git_ps1 "(\[\033[01;34m\]%s\[\033[00m\])") '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

## CUSTOM
EDITOR=vi; 
export EDITOR

## vi keybindings for bash
#set -o vi

## Gardens
export GARDENS_GITTOOLS=/var/www/gittools

function wikid {
        ( cd /usr/local/src/pywikid/wikid && TOKENFILE=WiKIDToken.wkd ./pywikid/pywikid.py 050019123119 )
}
 
function bastion() {
	 ssh-add $HOME/.ssh/id_rsa
	 ssh-add $HOME/.ssh/bastion_rsa
	 wikid
	 ssh -CA -p 40506 -l $USER bastion-21.network.hosting.acquia.com 
}

## Android
export PATH=$PATH:/usr/local/src/android-sdk-linux/tools:/usr/local/src/android-sdk-linux/platform-tools

## Go
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go

## Create a readable time from a unix timestamp.
function phptime {
  PHPCMD="print date('n/j/y h:i:s',$1);"
  eval env php -r \"$PHPCMD\"
  echo ''
}

# libboost
#export PATH=$PATH:/home/khankens/codes/cpp/boost_1_52_0:/usr/local/lib:/usr/local/include
export LD_LIBRARY_PATH=/usr/local/src/boost_1_52_0/stage/lib:$LD_LIBRARY_PATH
# libmicrohttpd
# export PATH=$PATH:/usr/local/src/libmicrohttpd/src/include

export FIELDS_ROOT="/home/khankens/Desktop/"
export EC2_ACCOUNT="gardens-dev"
export FIELDS_STAGE="gsteamer"

#export GIT_SSH=/usr/local/bin/git-ssh-wrapper

# RVM
source ~/.rvm/scripts/rvm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function serve {
  port="${1:-3000}"
  ruby -r webrick -e "s = WEBrick::HTTPServer.new(:Port => $port, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start"
}
source /etc/bash_completion.d/password-store

## mark functions
export MARKPATH=$HOME/.marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
    rm -i $MARKPATH/$1 
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

export GARDENS_FIELDS_REPO=/var/www/fields

# java
export JAVA_HOME="/usr/lib/jvm/jdk1.7.0_25"
export PATH="$PATH:$JAVA_HOME/bin"

export PATH="$PATH:/usr/local/src/android/sdk/tools:/usr/local/src/android/sdk/platform-tools"

export PATH="$PATH:/usr/local/src/phpstorm/bin"

export PATH="$PATH:/home/khankens/.composer/vendor/bin/"

export PATH="$PATH:/var/www/foreman/bin"
