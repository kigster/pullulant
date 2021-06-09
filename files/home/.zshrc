# vim: ft=sh
#
# Standard ~/.zshrc from project Pullulanit
# © 2010-2021 Konstantin Gredeskoul, MIT License
# @see https://github.com/kigster/pullulant

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:${HOME}/bin"

declare -a paths
paths=(
  ${HOME}/workspace/pullulant
  ${HOME}/.rbenv/shims
  ${HOME}/.pyenv/shims
  ${HOME}/.bashmatic/bin
)

function add-paths() {
  for path in "${paths[@]}"; do
    [[ -d "${path}" ]] && {
      [[ "${PATH}" =~ $path ]] || export PATH="${path}:${PATH}"
    }
  done
}

add-paths "${paths[@]}"

# uncomment to enable debug logging of sourced file paths
# export DEBUG=1

source ${HOME}/.bash_safe_source

safe-source "${HOME}/.bashmatic/init.sh"
safe-source "${HOME}/.bash_pullulant"
safe-source "${HOME}/.grc.bashrc"
safe-source "${HOME}/.zshrc.omz"
safe-source "${HOME}/.zshrc.${USER}"
safe-source "${HOME}/.bash_pu_git"

