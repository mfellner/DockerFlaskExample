# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "docker" do |d|
    d.build_dir = "."
    d.ports = ["80:80"]
    d.vagrant_vagrantfile = "vagrant/Vagrantfile"
  end
end
