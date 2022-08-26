# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTBOX_BOX       = ENV["VAGRANTBOX_BOX"] || "ubuntu/focal64"
VAGRANTBOX_NUM_NODES = ENV["VAGRANTBOX_NUM_NODES"] || 3
VAGRANTBOX_NUM_NODES = VAGRANTBOX_NUM_NODES.to_i
VAGRANTBOX_NETWORK   = ENV["VAGRANTBOX_NETWORK"] || "192.168.50"


Vagrant.configure("2") do |config|

  # vagrant plugin install vagrant-proxyconf
  if Vagrant.has_plugin?("vagrant-proxyconf")
    if ENV["http_proxy"]
      puts "http_proxy: " + ENV["http_proxy"]
      config.proxy.http   = ENV["http_proxy"]
    end
    if ENV["https_proxy"]
      puts "https_proxy: " + ENV["https_proxy"]
      config.proxy.https  = ENV["https_proxy"]
    end
    if ENV["no_proxy"]
      config.proxy.no_proxy = ENV["no_proxy"]
    end
  else
    puts "proxy not configured (use 'vagrant plugin install vagrant-proxyconf')"
  end

  (1..VAGRANTBOX_NUM_NODES).each do |i|
    config.vm.box = VAGRANTBOX_BOX
    config.vm.define "vagrantbox-#{i}" do |node|
      node.vm.hostname = "vagrantbox-#{i}"
      node.vm.network "private_network", ip: "#{VAGRANTBOX_NETWORK}.20#{i}"

      #config.vm.synced_folder '.', '/vagrant', disabled: true

      node.vm.provider "virtualbox" do |vb|
        vb.name = "vagrantbox-#{i}"
        vb.gui = false
        vb.memory = "2048"
      end

      # https://github.com/vagrant-libvirt/vagrant-libvirt#domain-specific-options
      node.vm.provider "libvirt" do |virt|
        virt.default_prefix = ""
        virt.memory = "2048"
      end

    end
  end

end
