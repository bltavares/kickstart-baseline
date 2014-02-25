source recipes/ruby.sh
kickstart.context ruby 1.9.3

kickstart.mute ruby-install --no-reinstall ruby 1.9.3
perl -p -i -e 's/^#?chruby.*/chruby 1.9.3/' `baseline.chruby.configuration` 2>/dev/null
