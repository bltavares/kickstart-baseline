source recipes/ruby.sh
kickstart.context "ruby 2.0"

kickstart.mute 'ruby-install --no-reinstall ruby 2.0'
sed -i 's/^#\?chruby.*/chruby 2.0/' /etc/profile.d/ruby.sh
