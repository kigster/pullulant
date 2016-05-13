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

umask 027

alias 'gst'='git status'
alias 'gpr'='git pull --rebase'
alias 'gprs'='git stash && git pull --rebase && git stash pop'
alias 'gs'='git status'
alias 'gc'='git co'
alias 'gd'='git diff'
alias 'gm'='git commit -m'
alias 'gl'='git log'
alias 'gpp'='git pull && git push'
alias 'ga'='git add'
alias 'gaa'='git add -A'
alias 'gap'='git add -p'
alias 'gpp'='git pull --rebase && git push'
alias networks="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s"
alias dc='cd'
alias dir='ls -lF'
alias lr='ls -alrt'
alias l='ls -alF'
alias ds='du -k  | grep -v "\/.*\/"'
alias diskspace="du -k | grep -v './.*\/'"
alias solo="pushd ~/workspace/sprout-wrap && git pull && be soloist && popd"
alias be="bundle exec"
alias ber="bundle exec rake"

alias ppxml="xmllint --format - | highlight --out-format=ansi --syntax=xml"
alias ppjson="jq '.'"
alias b64paste='pbpaste | base64 --decode'

alias al='cd ~/arduino/libraries'
alias ae='cd ~/projects/eclipse'
alias j='bundle exec jekyll serve --watch -D --baseurl ""'
# followed by user name
alias make_user_admin='sudo dseditgroup -o edit -t user admin -a '

alias dus='du -s ./* | sort -n | tail -10 | awk "{ printf \"    %10.1fGB %s\n\", \$1/1024/1024, \$2 }"'

function gcln() {
  repo=$1
  who=${2:-$USER}
  [[ "$who" == "kig" ]] && who="kigster"
  [[ -z "$repo" ]] && {
    printf "${bldred}Usage: gcl repo [github-username]${txtrst}\n" 
    return
  }
  git clone git@github.com:$who/$repo
}


bbinit() {
  b=$1
  have_it=$(which ${b})
  if [ -n "${have_it}" ]; then
    eval "$(${b} init -)"
  fi
}

# use it like this:
# initialize pyenv
# py
# shortcut to pyenv:
# py versions

function pyenv_init() {
  if [ -n "$*" ]; then
    pyenv $*
  else
    bbinit "pyenv"
  fi
}

function rbenv_init() {
  if [ -n "$*" ]; then
    rbenv $*
  else
    bbinit "rbenv"
  fi
}

weather() {
  zipcode=$1
  ansiweather -l $zipcode -u imperial -a1
}
