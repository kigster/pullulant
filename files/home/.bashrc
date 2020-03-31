#!/usr/bin/env bash
# © 2020 Konstantin Gredeskoul
# automatically appended by pullulant's installer
# vim: filetype=bash
[[ -f ~/.bash_pullulant ]] && source ~/.bash_pullulant
[[ -f ~/.bashmatic/init.sh ]] && source ${HOME}/.bashmatic/init.sh

eval "$(rbenv init -)"
eval "$(direnv hook bash)"
#eval "$(pyenv init -)"

export GOPATH=~/Dropbox/Code/oss/go
export PATH="${PATH}:${GOPATH}/bin"

[[ -f ~/.bash_bazel ]] && source ~/.bash_bazel
[[ -f ~/.bash_${USER} ]] && source ~/.bash_${USER}

[[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion
[[ -f /Users/kig/.sym.completion.bash ]] && source /Users/kig/.sym.completion.bash
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

alias mit="cat /Users/kig/Dropbox/Backups/Books/MIT-License | pbcopy"
#[[ -f /Users/kig/.sym.symit.bash ]] && source /Users/kig/.sym.symit.bash

# WarpDir (v1.6.1, appended on 2020-01-07 20:30:36 -0800) BEGIN
[[ -f ~/.bash_wd ]] && source ~/.bash_wd
# WarpDir (v1.6.1, appended on 2020-01-07 20:30:36 -0800) END

[[ -f ~/.bash_kig ]] && source ~/.bash_kig
export PATH=/Users/kig/.rbenv/bin:$PATH
