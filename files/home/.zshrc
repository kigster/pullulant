# vim: ft=sh
#
# Standard ~/.zshrc from project Pullulanit
# © 2010-2021 Konstantin Gredeskoul, MIT License
# @see https://github.com/kigster/pullulant

set +e

unset DEBUG
# uncomment to enable debug logging of sourced file paths
# export DEBUG=1
export DIRENV_LOG_FORMAT=
export DEBUG=
export GOPATH=/Users/kig/Dropbox/Code/oss/go
export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"

alias mkdir="/opt/homebrew/bin/gmkdir"

source ~/.bash_pu_colors
source ~/.bash_pu_aliases
source ~/.bash_pu_aliases_ag
source ~/.bash_pu_git

declare -a paths
paths=(
  /usr/local/bin
  /opt/homebrew/bin
  /opt/homebrew/opt/openssl@3/bin
  ${HOME}/workspace/pullulant
  ${HOME}/.rbenv/shims
  ${HOME}/.pyenv/shims
  ${HOME}/.bashmatic/bin
  ${HOME}/.volta
  /usr/bin
  /bin
)

unset p
declare p
[[ ${DEBUG} -eq 1 ]] && echo "Registering a total of ${#paths[@]} paths."

export PATH=

for p in "${paths[@]}"; do
  [[ -d "${p}" ]] && {
    [[ "${PATH}" =~ "$p" ]] || { 
      [[ ${DEBUG} -eq 1 ]] && echo "adding path [${p}]"
    }
  }
  export PATH="${PATH}:${p}"
  [[ ${DEBUG} -eq 1 ]] && echo -e "PATH=[${bldylw}${PATH}${clr}]"
done

unset p
source ${HOME}/.zshrc.omz
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
