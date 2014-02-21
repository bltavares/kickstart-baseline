kickstart.context tools

baseline.tools.packages() {
  kickstart.os.is Ubuntu && echo git-core exuberant-ctags aptitude
  kickstart.os.is Mac && echo git ctags
  echo curl emacs gawk mercurial vim zsh tmux
}

kickstart.package.install `baseline.tools.packages`
