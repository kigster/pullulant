#!/usr/bin/env bash
# encoding: UTF-8
source ~/.bash_colors

PYTHON_PROMPT_OFF=${PYTHON_PROMPT_OFF-''}
RUBY_PROMPT_OFF=${RUBY_PROMPT_OFF-''}

color_spacers=${bldblk}
color_ruby=${txtpur}
color_python=${txtpur}
color_time=${bldylw}
color_pwd=${txtblu}

SCM_THEME_PROMPT_DIRTY="${bldred} ☂ "
SCM_THEME_PROMPT_CLEAN="${bldgrn} ✔ "
SCM_THEME_PROMPT_PREFIX=" ${bldblk}(${txtwht}"
SCM_THEME_PROMPT_SUFFIX="${txtrst}${bldblk})"

RBENV_THEME_PROMPT_PREFIX=' ('
RBENV_THEME_PROMPT_SUFFIX=')'
VIRTUALENV_THEME_PROMPT_PREFIX=' ('
VIRTUALENV_THEME_PROMPT_SUFFIX=')'

export italic='\e[3;30m' # italic


function python_prompt {
  [[ -z "$PYTHON_PROMPT_OFF" ]] && echo -e "${VIRTUALENV_THEME_PROMPT_PREFIX}${color_python}$(env python --version 2>&1 | sed 's/[^.0-9]//g')${VIRTUALENV_THEME_PROMPT_SUFFIX}"
}
function ruby_prompt {
  [[ -z "$RUBY_PROMPT_OFF" ]] && echo -e "${color_ruby}$(rbenv_version_prompt)"
}

function date_time() {
  if [ "$1" == "color" ]; then
    date "+${txtylw}%A, ${bldgrn}%I:%M%p"
  else
    date "+%A, %I:%M%p"
  fi
}

function pullulant_environment {
  # TODO: make this dynamic!  # echo -e "${red}[tbd]${reset_color}"
  echo -e ""
}
function pullulant_where {
  echo -e "${orange}${USER}${txtrst}${txtblu} @ ${txtylw}${HOSTNAME}$(proper_reset)"
}

function proper_reset {
  [[ -z ${reset_seq} ]] && reset_seq=$(tput sgr0)
  echo $reset_seq
}

function command_status {
  code=$1
  [[ $code -eq 0 ]] && echo -e " ${bldgrn} ✔  ${txtrst}"
  [[ $code -ne 0 ]] && echo -e " ${bldwht}❗️ ${txtrst}"
}

function top_prompt() {
  local now=$(date_time)
  local len=$(($COLUMNS - ${#now} - 1))
  printf "\033[1000D\033[${len}C$(date_time color)"
}

function prompt_command() {
  local result=$?
  local top_row="$(pullulant_where)$(ruby_prompt)$(python_prompt) ${txtgrn}$(scm_char)$(scm_prompt_info)"
  local bottom_row="$(top_prompt)\n${color_pwd}in \w$(command_status $result)$(proper_reset)\n ⤷ "
  PS1="${top_row}${bottom_row}"
}

PROMPT_COMMAND=prompt_command;
