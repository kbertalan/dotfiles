if [ -d "$HOME/.encore" ]; then
  export ENCORE_INSTALL="$HOME/.encore"
  export PATH="$ENCORE_INSTALL/bin:$PATH"
fi
