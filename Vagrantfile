# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTBOX_BOX          = "generic/ubuntu2004"
VAGRANTBOX_NUM_NODES = ENV["VAGRANTBOX_NUM_NODES"] || 5
VAGRANTBOX_NUM_NODES = VAGRANTBOX_NUM_NODES.to_i
VAGRANTBOX_NETWORK   = ENV["VAGRANTBOX_NETWORK"] || "192.168.50"

Vagrant.configure("2") do |config|

  (1..VAGRANTBOX_NUM_NODES).each do |i|
    config.vm.box = VAGRANTBOX_BOX
    config.vm.define "vagrantbox-#{i}" do |node|
      node.vm.hostname = "vagrantbox-#{i}"

      # node.vm.network "forwarded_port", guest: 80, host: 8080
      # node.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
      # node.vm.network "public_network"
      node.vm.network "private_network", ip: "#{VAGRANTBOX_NETWORK}.20#{i}"

      node.disksize.size = '100GB'

      # WSL2 problem
      config.vm.synced_folder '.', '/vagrant', disabled: true

      node.vm.provider "virtualbox" do |vb|
        vb.name = "vagrantbox-#{i}"
        vb.gui = false
        vb.memory = "1024"
      end

      # https://github.com/vagrant-libvirt/vagrant-libvirt#domain-specific-options
      node.vm.provider "libvirt" do |virt|
        virt.default_prefix = ""
        virt.memory = "1024"
      end

      #node.vm.provision "ansible" do |ansible|
      #  ansible.playbook = "configure-vm.yml"
      #  ansible.compatibility_mode = "2.0"
      #end

    end
  end

end
