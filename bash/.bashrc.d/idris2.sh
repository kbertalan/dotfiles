if [ -d $HOME/.idris2/bin ]; then
  PATH=$HOME/.idris2/bin:$PATH
  eval "$(idris2 --bash-completion-script idris2)"
fi

