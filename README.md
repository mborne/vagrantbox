# vagrantbox

Vagrant helper with Ansible provisioning to create some local VM (`vagrantbox-01`, `vagrantbox-02`,...) to play with distributed systems.

## Requirements

```bash
# KVM support
vagrant plugin install vagrant-libvirt
# DNS resolution from host
vagrant plugin install vagrant-dns
# vagrant dns --uninstall
```

## Usage

```bash
bash start.sh
```

## Name resolution from host

```bash
# to configure /etc/hosts on host
ansible-playbook -i inventory configure-host.yml --ask-become-pass
# check
ping vagrantbox-01
ping vagrantbox-02
```

> See also [vagrant-dns plugin](https://github.com/BerlinVagrant/vagrant-dns)

## Ansible from host

> [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)

```bash
# to check connectivity
ansible -i inventory all -m ping
```

## K3S Kubernetes cluster

Start [K3S](https://k3s.io/) :

```bash
bash start-k3s.sh
```

It will display usage infos :

```bash
#----------------------------------------------------
# Usage :
#----------------------------------------------------
export KUBECONFIG=/home/mickael/vagrantbox/.k3s/config
kubectl cluster-info
```

```bash
export KUBECONFIG=$PWD/.k3s/config
kubectl cluster-info
```

## Ressources

* [computingforgeeks.com - Install KVM Hypervisor on Ubuntu 22.04|20.04](https://computingforgeeks.com/install-kvm-hypervisor-on-ubuntu-linux/)
* [KVM - ubuntu 20.04 setup notes](KVM.md)



