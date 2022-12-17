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

function archive() {
  local first="$1"
  local archive

  archive="$(echo "${first}" | sed 's/\/$//g; s/\//-/g; s/ /./g' | tr '[:upper:]' '[:lower:]')".7z
  [[ ${archive} =~ .7z$ ]] || archive="${archive}.7z"

  local -a directories
  local skipped=0
  local good=0
  local size=0
  local largest_size=0
  local largest_folder
  local dir_size

  for dir in "$@"; do
    dir_size="$(du -s "${dir}" | cut -f1)"

    if [[ ${dir_size} -gt ${largest_size} ]] ; then
      largest_size=${dir_size}
      largest_dir="${dir}"
    fi

    size=$(( size + dir_size ));
    [[ -d "${dir}" ]] || {
      warning "DIRECTORY: [${dir}] does not exist. Skipping."
      skipped=$((skipped + 1))
      continue
    }
    good=$(( good + 1 ))
    directories+=( "${dir}" )
  done

  if [[ ${good} -gt 0 ]]; then
    h2bg "Found ${good} existing directories, and ${skipped} bad ones." \
      "The largest folder is [${largest_folder}], size is $(( largest_size / 1024 / 1024))Mb"

    h1 "Archive:" "${bldylw}${archive}" \
       "Total size of all the folders is $(( size / 1024 / 1024 / 1024 )) Gb."

    h2 "Directories:" "${directories[@]}"

    if [[ ${skipped} -gt 0 ]]; then
      run.ui.press-any-key "Since some of your arguments are invalid, now is your change to Ctrl-C..." \
          "\n    ${bldred}Or press any key to continue..."
    fi
  fi

  command -v 7z >/dev/null || brew install -q p7zip
  clear

  info "Starting compression..."
  hr; echo
  printf "${txtblu}"
  # 7z a -sdel -mmt18 -mx7 -ssc -bb1 "${archive}" "$@"
  set -xe
  7z a -sdel -mmt18 -mx7 -ssc -bb1 "${archive}" "$@"
  local code=$?
  set +xe
  printf "${clr}\n"
  hr; echo

  ((code)) && {
    error "Archiving failed with code=${code}"
  } || {
    success "Archiving succeeded with exit code ${code}, and file size $(file.size.gb "${archive}")"
  }
  return ${code}
}

