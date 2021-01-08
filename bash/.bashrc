#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

PATH=$HOME/bin:$PATH

has() {
  which $1 > /dev/null 2> /dev/null
}

for script in $(find ~/.bashrc.d/ -name '*.sh' | sort); do
  source $script
done
