#!/usr/bin/env bash
# encoding: UTF-8

SCM_THEME_PROMPT_DIRTY="${bldred} ☂ "
SCM_THEME_PROMPT_CLEAN="${bldgrn} ✔ "
SCM_THEME_PROMPT_PREFIX=" ${txtblu}[${txtrst}${txtblk}"
SCM_THEME_PROMPT_SUFFIX="${txtrst}${txtblu}]"

RBENV_THEME_PROMPT_PREFIX="[rb-"
RBENV_THEME_PROMPT_SUFFIX="]"
VIRTUALENV_THEME_PROMPT_PREFIX='[py-'
VIRTUALENV_THEME_PROMPT_SUFFIX=']'

export italic='\e[3;30m' # italic

function python_version_prompt {
  echo -e "${VIRTUALENV_THEME_PROMPT_PREFIX}$(python --version 2>&1 | sed 's/[^.0-9]//g')${VIRTUALENV_THEME_PROMPT_SUFFIX}"
}

function pullulant_environment {
  # TODO: make this dynamic!
  # echo -e "${red}[tbd]${reset_color}"
  echo -e ""
}
function pullulant_where {
  echo -e "${txtrst}${txtblu}[${bldblu}${USER}${txtrst}${txtblu}@${bldblu}${HOSTNAME}${txtrst}${txtblu}]$(proper_reset)"
}

function proper_reset {
  [[ -z ${reset_seq} ]] && reset_seq=$(tput sgr0)
  echo $reset_seq
}

function command_status {
  code=$1
  [[ $code -eq 0 ]] && echo -e " ✔ "
  [[ $code -ne 0 ]] && echo -e "❗️ "
}

function prompt_command() {
  result=$?
  PS1="\n${bldblk}$(rbenv_version_prompt)$(python_version_prompt)$(pullulant_where) $(scm_char)$(scm_prompt_info)\n${bldgrn}in ${txtrst}${italic}${txtgrn}\w$(command_status $result)$(proper_reset)\n ⤷ "
}

PROMPT_COMMAND=prompt_command;
