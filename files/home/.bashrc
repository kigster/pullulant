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
export WS=$HOME/workspace
export NODE_PATH=/usr/local/share/npm
export PATH="$HOME/.rbenv/shims:$HOME/.pyenv/shims:$HOME/bin:/usr/local/bin:$NODE_PATH/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GOPATH=$HOME/$WS/golang
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
# set this to the location of your project,

export PGUSER=postgres

# Pullulant
export PU_HOME=%PU_HOME%
export PATH=$PATH:${PU_HOME}
unalias pu 2>/dev/null
export EDITOR=vim

function load_locals() {
  # load user's custom zsh file
  local scripts=(.bash_colors .bash_functions .bash_docker .bash_services .bash_aliases .bash_${USER} )
  printf $bldwht
  for script in ${scripts[@]}; do
    if [ -s "${HOME}/${script}" ]; then
      printf "${bakblu}Loading in ${bakgrn}%-20s${txtrst}\n" $script
      source "${HOME}/${script}"
    else
      printf "${txtrst}Whoops, ${bldred}${script}${txtrst} was not found, ignoring...${txtrst}\n"
    fi
  done
  echo
}

load_locals
