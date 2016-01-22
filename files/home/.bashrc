#!/usr/bin/env bash

function dkenv {
  if [ ! -z "$(which docker-machine)" ]; then
    docker_env=$(docker-machine env default 2>/dev/null)
    if [ $? -eq 0 ]; then
      eval "$(docker-machine env default 2>/dev/null)"
    fi
  fi
}

export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

dkenv

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export NODE_PATH=/usr/local/share/npm
export PATH="$HOME/.rbenv/shims:$HOME/.pyenv/shims:$HOME/bin:/usr/local/bin:$NODE_PATH/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
# set this to the location of your project,
export WS=$HOME/workspace
export PGUSER=postgres

if [ ! -z "$(which atom)" ]; then
  export EDITOR=atom
else
  export EDITOR=vim
fi

if [ ! -z "$(echo $SHELL | grep bash)" -a ! -z "$(which brew)" ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

scripts="~/.bash_colors \
         ~/.bash_docker \
         ~/.bash_${USER} \
         ~/.shell-aliases"

for script in $scripts; do
  if [ -f "${script}" ]; then
    source "${script}"
  fi
done
