source roles/java.sh
kickstart.info "Setting up clojure"

[ -e /usr/local/bin/lein ] || kickstart.download.file https://raw.github.com/technomancy/leiningen/stable/bin/lein /usr/local/bin/lein
chmod +x /usr/local/bin/lein
