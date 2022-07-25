if [ -d $HOME/.pack/bin ]; then
  PATH=$HOME/.pack/bin:$PATH
  eval "$(pack completion-script pack)"
elif [ -d $HOME/.idris2/bin ]; then
  PATH=$HOME/.idris2/bin:$PATH
fi

if has idris2; then
  eval "$(idris2 --bash-completion-script idris2)"
fi
