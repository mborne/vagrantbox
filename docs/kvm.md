# Using vagrantbox with KVM

## Install KVM packages

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

## Install vagrant-libvirt plugin

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

## Install UI for KVM (optional)

```bash
sudo apt install virt-manager
```

## Use libvirt provider with generic/ubuntu2204 box

```bash
export VAGRANTBOX_BOX=generic/ubuntu2204
vagrant up --provider=libvirt
```

## Ressources

* [phoenixnap.com - How to Install KVM on Ubuntu 20.04](https://phoenixnap.com/kb/ubuntu-install-kvm)
* [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)

