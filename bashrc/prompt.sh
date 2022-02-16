#!/bin/bash
COLOR_RED="\033[31m"
COLOR_YELLOW="\033[93m"
COLOR_GREEN="\033[32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[1;49;36m"
COLOR_WHITE="\033[37m"
COLOR_RESET="\033[0m"
BGCOLOR_WHITE="\033[7;49;39m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "rebase in progress" ]]; then
    printf $COLOR_RED
  elif [[ ! $git_status =~ "working directory clean" ]] && [[ ! $git_status =~ "working tree clean" ]]; then
    printf $COLOR_YELLOW
  elif [[ ! $git_status =~ "up-to-date" ]] && [[ ! $git_status =~ "up to date" ]]; then
    printf $COLOR_GREEN
  elif [[ $git_status =~ "nothing to commit" ]]; then
    printf $COLOR_BLUE
  else
    printf $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"
  local on_rebase="rebasing branch '([^${IFS}]*)'"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    printf "$branch"
  elif [[ $git_status =~ $on_rebase ]]; then
    local branch=${BASH_REMATCH[1]}
    printf "$branch"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    printf "$commit"
  fi

  local modifications="$(git status --short 2> /dev/null | wc -l | awk '{$1=$1};1')"
  if [[ $modifications != 0 ]]; then
    printf " +$modifications"
  fi

  printf "$COLOR_RESET "
}

function git-status()
{
  printf $BGCOLOR_WHITE
  git_color
  git_branch
  printf "$COLOR_RESET"
}

prompt()
{
  if [[ $LAST_STATUS == 141 ]]; then # SIGPIPE
    echo -e " =-_-= "
  elif [[ $LAST_STATUS == 130 ]]; then # Ctrl-C
    echo -e " =9_9= "
  elif [[ $LAST_STATUS == 129 ]]; then # seems to be the result of passing invalid arguments, such as git -v
    echo -e " =~o~=b"
  #elif [ $LAST_STATUS -eq 126 -o $LAST_STATUS -eq 255 ]; then # invalid command or user lacks permissions
  #  echo -e " =\`o\`= "
  elif [[ $LAST_STATUS == 1 ]]; then # execution error
    echo -e " =>_<= "
  elif [[ $LAST_STATUS != 0 ]]; then # catch all
    echo -e " =O_O= "
  else
    echo -e " =^-^= " # Happy happy!
  fi
}

fix_newline() {
  #echo ""
  local curpos
  echo -en "\E[6n"
  IFS=";" read -sdR -a curpos
  ((curpos[1]!=1)) && echo -e '\E[0m'
}

prompt_command() {
  LAST_STATUS=$?
  fix_newline

  history -a
  #maybe_chime

  RPWD=${PWD/#$HOME/\~}
  RPWD=$(echo $RPWD | perl -pe 's/~\/Uber\/sync\/([^\/]*).dev.uber.com$/$1:\//')
  RPWD=$(echo $RPWD | perl -pe 's/~\/Uber\/sync\/([^\/]*).dev.uber.com(\/.*)?/$1:$2/')
  RPWD=$(echo $RPWD | perl -pe 's/\/home\/uber/~/')
  RPWD=$(echo $RPWD | perl -pe 's/~\/work\/debootstrap\/ubuntu\/home\/ubuntu/ubuntu:~/')

  printf "\n$BGCOLOR_WHITE`prompt`\e[0;2;49;37m `datetime`\e[0m `whoami`@`hostname`\n$BGCOLOR_WHITE       \e[0;2;49;37m$COLOR_BLUE ${RPWD/#$HOME/~} \e[0m`git-status`\n"

  HISTORY_NUM=$(history | tail -1 | cut -d ' ' -f 2)
  let HISTORY_NUM+=1
  HISTORY_NUM=$(printf "% 6d " $HISTORY_NUM)

  PS1=$(printf "\[\e[7;49;39m\]$HISTORY_NUM\[\e[0m\] ")
  #PS1='\[\e[7;49;39m\]       \[\e[0m\] '
  PS2='\[\e[7;49;39m\]       \[\e[0m\] '
}

datetime() {
  date +"%Y-%m-%d %H:%M:%S"
}

PROMPT_COMMAND=prompt_command

printf "\e[7;49;39m\n"
printf "                             \n"
printf "            =^-^=            \n"
printf "         Hello Conor!        \n"
printf "                             \n"
printf "\e[0m"
