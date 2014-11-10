# -*- mode: ruby -*-
# vi: set ft=ruby :

def local_cache(box_name)
  cache_dir = File.join(File.expand_path("~/.vagrant.d"),
                        'cache',
                        'apt',
                        box_name)
  partial_dir = File.join(cache_dir, 'partial')
  FileUtils.mkdir_p(partial_dir) unless File.exists? partial_dir
  cache_dir
end

Vagrant.configure("2") do |config|
  hostname = ENV["host_name"]  || "baseline"
  config.vm.hostname = hostname
  config.vm.define hostname.to_sym unless ENV.fetch("use_default_box", "true") == "true"

  config.vm.box = "precise64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :private_network, ip: "192.168.33.10"

  cache_dir = local_cache(config.vm.box)
  config.vm.synced_folder cache_dir, "/var/cache/apt/archives/"
  config.vm.synced_folder "..", "/vagrant" if ENV['baseline_box']
  config.vm.synced_folder ".", "/baseline"

  config.vm.provision :shell do |shell|
    shell.inline = <<SHELL
    cd /opt
    if [ ! -d kickstart ]; then
      wget -O- https://github.com/bltavares/kickstart/archive/master.tar.gz | tar xz
      mv kickstart-master kickstart
      ln -s /opt/kickstart/bin/kickstart /usr/local/bin/kickstart
    fi
SHELL
  end

  config.vm.provision :shell do |shell|
    shell.inline = <<SHELL
    cd /baseline
    DEBUG="#{ENV['DEBUG']}" kickstart local vagrant #{ENV['baseline_kickstart']}
SHELL
  end
end
