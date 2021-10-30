#!/usr/bin/env bash
# © 2020 Konstantin Gredeskoul
# automatically appended by pullulant's installer
# vim: filetype=bash

# make `direnv` silent
export DIRENV_LOG_FORMAT=

# make the editor vim
export EDITOR=vim

#[[ -f ~/.bashmatic/init.sh ]] && source ${HOME}/.bashmatic/init.sh

# WarpDir (v1.7.0, appended on 2020-01-16 13:07:54 -0800) BEGIN
[[ -f ~/.bash_wd ]] && source ~/.bash_wd
# WarpDir (v1.7.0, appended on 2020-01-16 13:07:54 -0800) END


export DIRENV_LOG_FORMAT=

#[[ -f ~/.bash_bazel ]] && source ~/.bash_bazel
[[ -f ~/.bash_${USER} ]] && source ~/.bash_${USER}

#[[ -f /Users/kig/.sym.completion.bash ]] && source /Users/kig/.sym.completion.bash
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

#alias mit="cat /Users/kig/Dropbox/Backups/Books/MIT-License | pbcopy"
#[[ -f /Users/kig/.sym.symit.bash ]] && source /Users/kig/.sym.symit.bash

[[ -f ~/.grc.bashrc ]] && source ~/.grc.bashrc

export GOPATH="${HOME}/Dropbox/Code/oss/go"
export PATH="${HOME}/.rbenv/shims:${PATH}:${GOPATH}/bin"

eval "$(rbenv init -)"
eval "$(direnv hook bash)"

[[ -f ~/.bash_pullulant ]] && source ~/.bash_pullulant
