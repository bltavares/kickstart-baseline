source recipes/ruby.sh
kickstart.context ruby 2.0

kickstart.mute 'ruby-install --no-reinstall ruby 2.0'
perl -p -i -e 's/^#?chruby.*/chruby 2.0/' `baseline.chruby.configuration` 2>/dev/null
