# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "stash1" do |stash1|
    stash1.vm.box      = "centos65"
    stash1.vm.hostname = "stash.home"
    stash1.vm.network :private_network, ip: "192.168.33.10"
    stash1.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  end
  config.vm.define "stash2" do |stash2|
    stash2.vm.box      = "centos59"
    stash2.vm.hostname = "stash.home"
    stash2.vm.network :private_network, ip: "192.168.33.11"
    stash2.vm.box_url  = "http://puppet-vagrant-boxes.puppetlabs.com/centos-59-x64-vbox4210.box"
  end
  config.vm.define "stash3" do |stash3|
    stash3.vm.box      = "ubuntu1204"
    stash3.vm.hostname = "stash.home"
    stash3.vm.network :private_network, ip: "192.168.33.12"
    stash3.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "site.pp"
    puppet.options = "--verbose"
  end

end
