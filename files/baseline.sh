provision () {
  (
  cd /baseline
  sudo kickstart local vagrant "$@"
  )

  if [[ $SHELL = *bash ]]; then
    echo "sourcing /etc/profile"
    source /etc/profile
  fi

  if [[ $SHELL = *zsh ]]; then
    echo "sourcing $HOME/.zshenv"
    source $HOME/.zshenv
  fi
}

