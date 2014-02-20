kickstart.info "Setting up ruby 2.0"

source recipes/ruby.sh
kickstart.mute 'ruby-install --no-reinstall ruby 2.0'
sed -i 's/^#\?chruby.*/chruby 2.0/' /etc/profile.d/ruby.sh
