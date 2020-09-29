# Bash history

export HISTSIZE=1000000
export HISTFILESIZE=2000000
shopt -s histappend
PROMPT_COMMAND='history -a'

# Utils

alias copy="tr -d '\n' | xclip -sel clip"

# Git

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

alias git-branch=parse_git_branch

# Command line style

color_green='\[\033[01;32m\]'
color_white='\[\033[00m\]'
color_blue='\[\033[01;34m\]'
color_red='\[\033[01;31m\]'

function get_branch {
  if [ ! -z "$(parse_git_branch)" ]; then
    echo "($(parse_git_branch))"
  else
    echo ""
  fi
}

export PS1="\${debian_chroot:+(\$debian_chroot)}$color_green\u@\h$color_white:$color_blue\w$color_red\$(get_branch)$color_white\$ "
