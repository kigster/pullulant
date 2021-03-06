#!/usr/bin/env bash
# vim: ft=bash
. /usr/local/etc/bash_completion

# Path to the bash it configuration
export BASH_IT="/Users/kig/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME="powerline-multiline"
# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
#export BASH_IT_REMOTE='bash-it'
export BASH_IT_REMOTE='kigster/bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# source ~/.powerline
# Load Bash It

export POWERLINE_LEFT_PROMPT="ruby cwd"
export POWERLINE_RIGHT_PROMPT="clock battery user_info hostname"

export BASH_IT_P4_DISABLED=true

export SCM=git
#export SCM_CHECK=true
export SCM_GIT_SHOW_CURRENT_USER=true
#export SCM_GIT_SHOW_DETAILS=false
#export SCM_GIT_SHOW_COMMIT_COUNT=false
#export SCM_GIT_SHOW_MINIMAL_INFO=false
#export SCM_GIT_SHOW_REMOTE_INFO=false
#export SCM_GIT_SHOW_STASH_INFO=false

if [[ "${ITERM_PROFILE}" =~ "Light" || "${ITERM_PROFILE}" =~ "light" ]]; then
  export BASH_IT_COLORSCHEME=light
else
  export BASH_IT_COLORSCHEME=dark
fi

source "${BASH_IT}"/bash_it.sh
source "${HOME}"/.bashrc

export POWERLINE_LEFT_PROMPT="ruby scm cwd"

