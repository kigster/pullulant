#!/usr/bin/env bash
# © 2020 Konstantin Gredeskoul
# automatically appended by pullulant's installer
# vim: filetype=bash

export EDITOR=vim

# WarpDir (v1.7.0, appended on 2020-01-16 13:07:54 -0800) BEGIN
[[ -f ~/.bash_wd ]] && source ~/.bash_wd
# WarpDir (v1.7.0, appended on 2020-01-16 13:07:54 -0800) END

#export GPG_TTY=$(tty)
[[ -f ~/.bash_pullulant ]] && source ~/.bash_pullulant
[[ -f ~/.bashmatic/init.sh ]] && source ${HOME}/.bashmatic/init.sh

eval "$(rbenv init -)"
eval "$(direnv hook bash)"

#[[ -f ~/.bash_bazel ]] && source ~/.bash_bazel
[[ -f ~/.bash_${USER} ]] && source ~/.bash_${USER}

#[[ -f /Users/kig/.sym.completion.bash ]] && source /Users/kig/.sym.completion.bash
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

#alias mit="cat /Users/kig/Dropbox/Backups/Books/MIT-License | pbcopy"
#[[ -f /Users/kig/.sym.symit.bash ]] && source /Users/kig/.sym.symit.bash

[[ -f ~/.grc.bashrc ]] && source ~/.grc.bashrc

export GOPATH="${HOME}/Dropbox/Code/oss/go"
export PATH="/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin:${HOME}/bin:${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${GOPATH}/bin"

