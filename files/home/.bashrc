#!/usr/bin/env bash
# © 2020 Konstantin Gredeskoul
# automatically appended by pullulant's installer
# vim: filetype=bash

export EDITOR=vim
export GOPATH="${HOME}/Dropbox/Code/oss/go"
export GPG_TTY=$(tty)
export HISTCONTROL=ignoredups
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
export PAGER='less -R'
export PGUSER=postgres
export QUOTING_STYLE=literal
export RI='-f ansi'
export GITHUG_TOKEN="$(git config user.token)"

export PATH="${PATH}:${GOPATH}/bin"

command -v rbenv >/dev/null   && eval "$(rbenv init -)"

alias dir="ls --color=always -a -l"

function ddr() {
  local log_dir="/opt/datadog-agent/logs/"
  ps -ef | grep -iq [d]atadog && run "datadog-agent stop || sleep 5"
  ps -ef | grep -iq [d]atadog && run "datadog-agent stop; ps -ef | grep [d]atadog | awk '{print \$2}'; sleep 1"

  h1 'Starting Datadog Agent...'
  run.set-next show-output-on
  run "nohup datadog-agent start 1>>${log_dir}/stdout.log 2>>${log_dir}/stderr.log &"
  hr
  ps -ef | grep -i datadog 
  hr
  bash /usr/local/bin/it
} 

set +e

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
source ~/.grc.bashrc
alias foreman='colourify foreman'
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
unalias ag
