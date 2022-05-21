# vagrantbox

Vagrant helper with Ansible provisioning to create some local VM (`vagrantbox-01`, `vagrantbox-02`,...) to play with distributed systems.

## How it works?

> TODO

## Usage

With KVM :

```bash
vagrant plugin install vagrant-libvirt
vagrant up --provider=libvirt
```

## Ansible

```bash
# to check connectivity
ansible -i inventory all -m ping
# to configure /etc/hosts on host
ansible-playbook -i inventory configure-host.yml --ask-become-pass
# check
ping vagrantbox-01
ping vagrantbox-02
```

## Ressources

* [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)
* [KVM - ubuntu 20.04 setup notes](KVM.md)
* [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)
* [vagrant-dns plugin](https://github.com/BerlinVagrant/vagrant-dns)

