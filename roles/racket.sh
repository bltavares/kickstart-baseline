kickstart.info "Setting up sml"

racket_dest=racket_install.sh

check_racket_integrity() {
  [ -f $racket_dest ]
}

install_racket() {
  echo -e "no\\n4\\n\\n" | kickstart.mute "sh $racket_dest"
}

(
  cd /opt
  check_racket_integrity || kickstart.download.file http://download.racket-lang.org/installers/5.92/racket-5.92-x86_64-linux-ubuntu-quantal.sh $racket_dest
  [ `which racket` ] || install_racket
)
kickstart.path.add_to_profile.d racket.sh
