#!/usr/bin/env bash
# vim: ft=bash

[[ -f ~/.bash_safe_source ]] && source ~/.bash_safe_source
[[ -f ~/.bashmatic/.bash_safe_source ]] && source ~/.bashmatic/.bash_safe_source

[[ -f /usr/local/etc/bash_completion ]] && src /usr/local/etc/bash_completion

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


export BASH_IT_P4_DISABLED=true

#export SCM_GIT_SHOW_MINIMAL_INFO=false

if [[ "${ITERM_PROFILE}" =~ "Light" || "${ITERM_PROFILE}" =~ "light" ]]; then
  export BASH_IT_COLORSCHEME=light
elif [[ "${ITERM_PROFILE}" =~ "Dark" || "${ITERM_PROFILE}" =~ "dark" ]]; then
  export BASH_IT_COLORSCHEME=dark
else
  export BASH_IT_COLORSCHEME=tango
fi

export SCM=git
export SCM_CHECK=true
export SCM_GIT_SHOW_CURRENT_USER=true
export SCM_GIT_SHOW_DETAILS=true
export SCM_GIT_SHOW_COMMIT_COUNT=false
export SCM_GIT_SHOW_REMOTE_INFO=true
export SCM_GIT_SHOW_STASH_INFO=true

src "${BASH_IT}"/bash_it.sh

export POWERLINE_LEFT_PROMPT="scm cwd"
export POWERLINE_RIGHT_PROMPT="clock node"

[[ -f ${HOME}/.bashmatic_debug ]] && {
  export BASHMATIC_DEBUG=1
  export BASHMATIC_PATH_DEBUG=1
  export DEBUG=1
}

[[ -z ${BASHMATIC_HOME} ]] && export BASHMATIC_HOME="${HOME}/.bashmatic"
[[ -d ${BASHMATIC_HOME} ]] || bash -c "$(curl -fsSL https://bashmatic.re1.re); bashmatic-install -q"
[[ -d ${BASHMATIC_HOME} ]] || {
  echo "Can't find Bashmatic, even after attempting an installation."
  echo "Please install Bashmatic with the following command line:"
  echo 'bash -c "$(curl -fsSL https://bashmatic.re1.re); bashmatic-install"'
}

src ~/.bash_it/colorschemes/tango*
src "${HOME}"/.bashrc

