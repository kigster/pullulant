set +e

declare -a BASH_INIT_FILES=(
  /usr/local/etc/bash_completion
  ~/.bashmatic/init.sh
  ~/.bash_it_init
  ~/.bash_it/bash_it.sh
  ~/.bash_kig
  ~/.bash_coinbase
  ~/.bash_bazel
  ~/.bash_pullulant
  ~/.fzf.bash
)

export SSH=false

say() {
  if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
    export SSH_LOGIN=true
    return
  else
    printf "$*"
  fi
}

install-xcode-tools() {
  [[ -z $(which git) ]] && {
    set -x
    xcode-select --install
    set +x
  }
}

install-xcode-tools

install-bash-it(){
  [[ -d ${HOME}/.bash_it ]] || {
    git clone https://github.com/kigster/bash-it .bash_it
    cd .bash_it && ./install.sh -n # does not modifies existing dot files
  }
}
install-bash-it

install-bashmatic() {
  export BashMatic="${HOME}/.bashmatic"
  [[ -s ${BashMatic}/init.sh ]] || {
    rm -rf "${BashMatic}" 2>/dev/null
    set -e
    git clone https://github.com/kigster/bashmatic .bashmatic 2>&1 1>/dev/null
    set +e
  }
}

install-bashmatic
source ~/.bashmatic/init.sh

load-dotfiles() {
  for file in "$@"; do
    say "   ${clr} — ${bldblu}${file}${clr}"
    if ! [[ -f ${file} ]]; then
      if [[ -z ${SSH_LOGIN} ]]; then
        cursor.rewind -100
        say " ${bldred} 𐄂\n"
      fi
    else
      if [[ -z ${SSH_LOGIN} ]]; then
        cursor.rewind -1000
        say " ${bldgrn} ✔ \n"
      fi
      source "${file}"
    fi
  done
}

load-custom-bash-configs() {
  load-dotfiles "${BASH_INIT_FILES[@]}"
}

main() {
  load-custom-bash-configs
}

main "$@"
