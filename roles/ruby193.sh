source recipes/ruby.sh
kickstart.context "ruby 1.9.3"

kickstart.mute 'ruby-install --no-reinstall ruby 1.9.3'
sed -i 's/^#\?chruby.*/chruby 1.9.3/' /etc/profile.d/ruby.sh
