has() {
  which $1 > /dev/null 2> /dev/null
}

if has terraform; then
  complete -C "$(which terraform)" terraform
fi

