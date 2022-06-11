# vagrantbox

Vagrant helper with Ansible provisioning to create some local VM (`vagrantbox-01`, `vagrantbox-02`,...) to play with distributed systems.

## Requirements

* Ansible
* VirtualBox

## Usage

* Start VMs : `vagrant up`
* [Configure hostname resolution from host](docs/resolv-hostname.md)

```bash
ansible-playbook -i inventory configure-host.yml --ask-become-pass
```

* Check connectivity : `ansible -i inventory all -m ping`


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

## See also

* [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)
