#!/usr/bin/env bash
# © 2020 Konstantin Gredeskoul
# automatically appended by pullulant's installer
# vim: filetype=bash

export DIRENV_LOG_FORMAT=
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

[[ -d ~/.bashmatic && ! ${PATH} =~ bashmatic ]] && \
  export PATH="${PATH}:${HOME}/.bashmatic/bin"

command -v rbenv >/dev/null   && eval "$(rbenv init -)"
command -v direnv >/dev/null  && eval "$(direnv hook bash)"

if [[ -x /opt/homebrew/bin/brew ]] ; then
  if [[ $(arch) == "i386" ]]; then
    alias brew='arch -x86_64 /opt/homebrew/bin/brew'
  else
    alias brew='arch -arm64 /opt/homebrew/bin/brew'
  fi
else
  alias brew="/usr/local/bin/brew"
fi

command -v brew >/dev/null    && export PATH="$(brew --prefix)/bin:${PATH}"

alias dir="ls --color=always -a -l"

set +e
