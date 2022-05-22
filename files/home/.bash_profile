# © 2020 Konstantin Gredeskoul
# automatically appended by pullulant's installer
# vim: filetype=bash

set +e

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

[[ -f ~/.bash_pullulant ]]              && source ~/.bash_pullulant :bazel :bashmatic :bash_it
[[ -f ~/.bash_pu_bashmatic ]]           && source ~/.bash_pu_bashmatic
[[ -f ~/.bash_pu_bash_it ]]             && source ~/.bash_pu_bash_it

[[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion

export GRC_ALIASES=true

command -v fzf          >/dev/null && [[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
command -v grc          >/dev/null && [[ -f ~/.grc.bashrc ]] && source ~/.grc.bashrc
command -v warp-dir     >/dev/null && [[ -f ~/.bash_wd ]] && source ~/.bash_wd

set +e
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


alias dir="ls --color=always -a -lF"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

source ~/.bash_it/bash_it.sh
bashit-prompt-developer && bashit-colorscheme dark-monaco

[[ -f "${HOME}/.bashrc.${USER}" ]] && source "${HOME}/.bashrc.${USER}"
[[ -f "${HOME}/.bashrc.healthsherpa" ]] && source "${HOME}/.bashrc.healthsherpa"

command -v rbenv >/dev/null   && {
  eval "$(rbenv init -)"
command -v direnv>/dev/null   && eval "$(direnv hook bash)"

complete -C /usr/local/bin/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/google-cloud-sdk/completion.bash.inc'; fi

export BASHMATIC_HOME="${HOME}/.bashmatic"
[[ -f ${BASHMATIC_HOME}/init.sh ]] && source ${BASHMATIC_HOME}/init.sh

[[ -f ~/.bashrc ]] && source ~/.bashrc
