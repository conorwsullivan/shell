c() {
  cd $1;
  printf "\n\033[1;49;36m$PWD\033[0m\n"
  ls;
}

alias please=sudo
#alias apt-get="aptitude"
alias apt-cache="aptitude"
alias apt="aptitude"
alias cw="c ~/work"
alias cs="c ~/work/shell"
alias cnc="c ~/work/newcity/src"
alias ca="c /media/TheInfo/Art"
alias v=nvim
alias g=git
alias gs="g s"
__git_complete g __git_main
alias vim="nvim"
alias grep="egrep -i --color"
alias bc="bc -l"
alias feh="feh --fullscreen"
alias src="source ~/.bashrc"
#alias cal="cal -3"
alias py="python"
alias p="sudo pacman"
alias free="free -h"
alias dd="dd status=progress"
alias cp="cp -v"
alias ls="ls -ah"

