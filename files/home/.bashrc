
# WarpDir (v1.6.1, appended on 2019-09-11 12:14:15 -0700) BEGIN
[[ -f ~/.bash_wd ]] && source ~/.bash_wd
# WarpDir (v1.6.1, appended on 2019-09-11 12:14:15 -0700) END


# automatically appended by pullulant's installer
[[ -f ~/.bash_pullulant ]] && source ~/.bash_pullulant
[[ -f ~/.bashmatic/init.sh ]] && source ~/.bashmatic/init.sh

eval "$(rbenv init -)"
eval "$(direnv hook bash)"
#eval "$(pyenv init -)"

export GOPATH=~/Coinbase/golang
export PATH="${PATH}:${GOPATH}/bin"

[[ -f ~/.bash_bazel ]] && source ~/.bash_bazel
[[ -f ~/.bash_${USER} ]] && source ~/.bash_${USER}

[[ -f /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion
[[ -f /Users/kig/.sym.completion.bash ]] && source /Users/kig/.sym.completion.bash
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

alias mit="cat /Users/kig/Dropbox/Backups/Books/MIT-License | pbcopy"
