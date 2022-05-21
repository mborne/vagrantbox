
## How it works?

* KVM is used to create 3 nodes


## Pre-requisite

```bash
# dépendance
sudo apt install qemu libvirt-daemon-system libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base

# droit d'exécution
sudo adduser $USER libvirt

# interface graphique
sudo apt install virt-manager

# plugin vagrant
vagrant plugin install vagrant-libvirt
```

```bash
vagrant up --provider=libvirt
```

https://ostechnix.com/how-to-use-vagrant-with-libvirt-kvm-provider/

