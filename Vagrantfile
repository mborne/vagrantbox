# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTBOX_BOX          = "generic/ubuntu2004"
VAGRANTBOX_NUM_NODES = ENV["VAGRANTBOX_NUM_NODES"] || 2
VAGRANTBOX_NUM_NODES = VAGRANTBOX_NUM_NODES.to_i
VAGRANTBOX_NETWORK   = ENV["VAGRANTBOX_NETWORK"] || "192.168.30"

Vagrant.configure("2") do |config|

  (1..VAGRANTBOX_NUM_NODES).each do |i|
    config.vm.box = VAGRANTBOX_BOX
    config.vm.define "vagrantbox-0#{i}" do |node|
      node.vm.hostname = "vagrantbox-0#{i}"
      node.vm.network "private_network", ip: "#{VAGRANTBOX_NETWORK}.10#{i}"
      node.disksize.size = '30GB'

      node.vm.provider "virtualbox" do |vb|
        vb.name = "vagrantbox-0#{i}"
        vb.gui = false
        vb.memory = "512"
      end

      # https://github.com/vagrant-libvirt/vagrant-libvirt#domain-specific-options
      node.vm.provider "libvirt" do |virt|
        virt.default_prefix = ""
        virt.memory = "512"
      end

      node.vm.provision "ansible" do |ansible|
        ansible.playbook = "configure-vm.yml"
        ansible.compatibility_mode = "2.0"
      end

    end
  end

end
