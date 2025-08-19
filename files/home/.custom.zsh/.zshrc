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

source .custom.bash/.bash_pu_colors
source .custom.bash/.bash_pu_aliases
source .custom.bash/.bash_pu_aliases_ag
source .custom.bash/.bash_pu_git
