#!/usr/bin/env bash
# encoding: UTF-8

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"
SCM_THEME_PROMPT_PREFIX=" ${yellow}|${reset_color}"
SCM_THEME_PROMPT_SUFFIX="${yellow}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"
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
  echo -e "${green}[${purple}${USER}@${yellow}${HOSTNAME}${green}]${reset_color}"
}

function prompt_command() {
  PS1="\n${green}$(python_version_prompt)${bldblu}$(pullulant_where) ${orange}in ${reset_color}\w\n${yellow}$(scm_char)$(scm_prompt_info) ${yellow}→${white}${reset_color} "
}

PROMPT_COMMAND=prompt_command;
