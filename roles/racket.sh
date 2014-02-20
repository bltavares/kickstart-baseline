kickstart.context "racket"

baseline.racket.install() {
  local racket_dest=racket_install.sh

  baseline.racket.check_integrity() {
    [ -f $racket_dest ]
  }

  baseline.racket.install.racket() {
    echo -e "no\\n4\\n\\n" | kickstart.mute "sh $racket_dest"
  }

  (
  cd /opt
  baseline.racket.check_integrity || kickstart.download.file http://download.racket-lang.org/installers/5.92/racket-5.92-x86_64-linux-ubuntu-quantal.sh $racket_dest
  [ `which racket` ] || baseline.racket.install.racket
  )
  kickstart.path.add_to_profile.d racket.sh
}
baseline.racket.install
