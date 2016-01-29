#!/usr/bin/env bash
#_______________________________________________________________________________
#
# (c) 2016 Konstantin Gredeskoul
# https://github.com/kigster
#
# For project Pullulant
# https://github.com/kigster/pullulant/
#
# MIT License
#_______________________________________________________________________________


export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export NODE_PATH=/usr/local/share/npm
export PATH="$HOME/.rbenv/shims:$HOME/.pyenv/shims:$HOME/bin:/usr/local/bin:$NODE_PATH/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
# set this to the location of your project,
export WS=$HOME/workspace
export PGUSER=postgres

if [ -n "$(which atom)" ]; then
  export EDITOR=atom
else
  export EDITOR=vim
fi

if [ ! -z "$(echo $SHELL | grep bash)" -a ! -z "$(which brew)" ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

# load user's custom zsh file
scripts=(.bash_colors .bash_docker .bash_services .bash_aliases .zsh-${USER} )

for script in ${scripts[@]}; do
  if [ -s "${HOME}/${script}" ]; then
    source "${HOME}/${script}"
  else
    printf "${script} was not found, ignored...\n"
  fi
done

dkenv
services_intro
