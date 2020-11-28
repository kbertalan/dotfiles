#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

PATH=$HOME/.local/bin:$HOME/bin:$PATH

if which stack > /dev/null 2> /dev/null; then
  eval "$(stack --bash-completion-script stack)"
fi

EDITOR=nvim

if [ -f /usr/lib/bash-git-prompt/gitprompt.sh ]; then
   # To only show the git prompt in or under a repository directory
   # GIT_PROMPT_ONLY_IN_REPO=1
   # To use upstream's default theme
   # GIT_PROMPT_THEME=Default
   # To use upstream's default theme, modified by arch maintainer
   GIT_PROMPT_THEME=Default_Arch
   source /usr/lib/bash-git-prompt/gitprompt.sh
fi

