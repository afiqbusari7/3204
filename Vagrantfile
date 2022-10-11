# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.provider "virtualbox" do |vb|
    # vb.gui = true
    vb.memory = "4096"
  end
  config.vm.box = "hashicorp/bionic64"
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.vm.network "forwarded_port", guest: 5601, host: 5601
  config.vm.network "forwarded_port", guest: 8889, host: 8889
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.provision "shell", path: "set_sysctl.sh", run: "always"

  $script = <<-SHELL
   sudo apt-get update && sudo apt-get upgrade -y
   # Add desktop environment
   sudo apt install -y --no-install-recommends ubuntu-desktop
   sudo apt install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
  #  # Restart
  #  sudo shutdown -r now
SHELL
config.vm.provision "shell", inline: $script, privileged: false
config.vm.provision :docker
config.vm.provision :docker_compose, yml: "/vagrant/docker-compose.yml", rebuild: true, run: "always"


end
