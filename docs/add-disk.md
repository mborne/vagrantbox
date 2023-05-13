# Vagrant - How to add a disk for VirtualBox?

```ruby
node.vm.provider "virtualbox" do |vb|
    vb.name = "vagrantbox-#{i}"
    vb.gui = false
    vb.memory = "2048"

    diskPath = "./.vagrant/data-#{i}.vdi"
    unless File.exist?(diskPath)
        vb.customize [ 
        'createhd', '--filename', diskPath, '--format', 'VDI', '--variant', 'Standard', '--size', 100 * 1024
        ]
    end
    vb.customize [
        'storageattach', :id, '--storagectl', 'SCSI', 
        '--port', 2, # sdc (see "lsblk")
        '--device', 0, 
        '--type', 'hdd', 
        '--medium', diskPath
    ]
end
```