kickstart.info "Setting up haskell"

kickstart.package.install haskell-platform
kickstart.path.add_to_profile.d cabal.sh
