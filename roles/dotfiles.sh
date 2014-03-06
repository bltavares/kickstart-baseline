source roles/tools.sh
kickstart.context dotfiles

source files/dotfiles.sh

baseline_dotfiles_user=${baseline_dotfiles_user:-`whoami`}

kickstart.user.exec $baseline_dotfiles_user '[ -d ~/dot-files ]' || \
  kickstart.user.exec $baseline_dotfiles_user "git clone ${baseline_dotfiles_url} ~/dot-files"

kickstart.user.exec $baseline_dotfiles_user '[ -f ~/.baseline_dotfiles ]' || \
  kickstart.user.exec $baseline_dotfiles_user 'cd ~/dot-files; ./install.sh'
