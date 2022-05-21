# -*- mode: ruby -*-
# vi: set ft=ruby :

K3S_BOX          = "generic/ubuntu2004"
K3S_NUM_NODES = ENV["K3S_NUM_NODES"] || 1
K3S_NUM_NODES = K3S_NUM_NODES.to_i
K3S_NETWORK      = ENV["K3S_NETWORK"] || "192.168.30"

Vagrant.configure("2") do |config|

  (1..K3S_NUM_NODES).each do |i|
    config.vm.box = K3S_BOX
    config.vm.define "k3s-0#{i}" do |node|
      node.vm.hostname = "k3s-0#{i}"
      node.vm.network "private_network", ip: "#{K3S_NETWORK}.10#{i}"
      node.disksize.size = '100GB'
      node.vm.provider "virtualbox" do |vb|
        vb.name = "k3s-0#{i}"
        vb.gui = false
        vb.memory = "1024"
      end

      # node.vm.provision "ansible" do |ansible|
      #   ansible.playbook = "configure-vm.yml"
      #   ansible.compatibility_mode = "2.0"
      # end

    end
  end

end
