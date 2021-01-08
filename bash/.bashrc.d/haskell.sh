if has ghcup; then
  PATH=$HOME/.ghcup/bin:$PATH
fi

if has cabal; then
  PATH=$HOME/.cabal/bin:$PATH
fi

if has stack; then
  PATH=$HOME/.local/bin:$PATH
  eval "$(stack --bash-completion-script stack)"
fi

