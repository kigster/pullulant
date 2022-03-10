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

[[ -d ~/.bashmatic && ! ${PATH} =~ bashmatic ]] && export PATH="${PATH}:${HOME}/.bashmatic/bin"

command -v brew >/dev/null    && export PATH="$(brew --prefix)/bin:${PATH}"
command -v rbenv >/dev/null   && eval "$(rbenv init -)"
command -v direnv >/dev/null  && eval "$(direnv hook bash)"

alias dir="ls --color=always -a -l"
