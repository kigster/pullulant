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


#export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export NODE_PATH=/usr/local/share/npm
export PATH="$HOME/.rbenv/shims:$HOME/.pyenv/shims:$HOME/bin:/usr/local/bin:$NODE_PATH/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GOPATH=$HOME/workspace/golang
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
# set this to the location of your project,
export WS=$HOME/workspace
export PGUSER=postgres

# Pullulant
export PU_HOME=/Users/hired/workspace/kig/pullulant
export PATH=$PATH:${PU_HOME}
unalias pu 2>/dev/null
export PROJECT_PATHS="~/workspace/kig:~/workspace:~/cpp"
export EDITOR=vim

function load_locals() {
  # load user's custom zsh file
  local scripts=(.bash_colors .bash_functions .bash_docker .bash_services .bash_aliases .bash_${USER} )
  local highlight='\e[7;34m'
  local reset='\e[0;0m'
  for script in ${scripts[@]}; do
    printf "Sourcing in ${highlight}${script}${reset}...\n"
    if [ -s "${HOME}/${script}" ]; then
      source "${HOME}/${script}"
    else
      printf "Whoops, ${highlight}${script}${reset} was not found, ignoring...\n"
    fi
  done
}

load_locals
