# KVM

## Install KVM

From [How to Install KVM on Ubuntu 20.04](https://phoenixnap.com/kb/ubuntu-install-kvm)

```bash
# Step 1: Install KVM Packages
sudo apt update
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
# Step 2: Authorize Users
sudo adduser $USER libvirt

# Step 3: Verify the Installation
virsh list --all
sudo systemctl status libvirtd
```

## Start VM with KVM

```bash
# Install vagrant plugin dependencies
sudo apt-get install build-essential libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev
# Install vagrant plugin
vagrant plugin install vagrant-libvirt
# Start VMs
vagrant up --provider=libvirt
# Destroy VMs
vagrant destroy -f --provider=libvirt
```

## Install graphical UI for KVM

```bash
sudo apt install virt-manager
```

## See also

* [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)
* [KVM - ubuntu 20.04 setup notes](KVM.md)
