#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

PATH=$HOME/bin:$PATH

for script in $(find ~/.bashrc.d/ -name '*.sh' | sort); do
  source $script
done
