#!/usr/bin/env bash
# encoding: UTF-8

SCM_THEME_PROMPT_DIRTY=" ${bldred}✗"
SCM_THEME_PROMPT_CLEAN=" ${bldgrn}✓"
SCM_THEME_PROMPT_PREFIX=" ${bldylw}|${reset_color}"
SCM_THEME_PROMPT_SUFFIX="${bldylw}|"

RBENV_THEME_PROMPT_PREFIX="[ruby-"
RBENV_THEME_PROMPT_SUFFIX="]"
VIRTUALENV_THEME_PROMPT_PREFIX='|'
VIRTUALENV_THEME_PROMPT_SUFFIX='|'

function python_version_prompt {
  echo -e "[$(python --version 2>&1 | sed 's/[^.0-9]//g')]"
}
function pullulant_environment {
  # TODO: make this dynamic!
  # echo -e "${red}[tbd]${reset_color}"
  echo -e ""
}
function pullulant_where {
  echo -e "${bldgrn}[${bldgrn}${USER}@${bldylw}${HOSTNAME}${bldgrn}]${reset_color}"
}

function prompt_command() {
  PS1="\n${bldblk}$(rbenv_version_prompt)$(pullulant_where)${orange} in ${reset_color}\w\n${txtylw}$(scm_char)$(scm_prompt_info) ${bldylw}→${lbdwht}${reset_color}${white} "
}

PROMPT_COMMAND=prompt_command;
