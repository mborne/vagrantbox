# vagrantbox

Vagrant helper with Ansible provisioning to create some local VM (`vagrantbox-01`, `vagrantbox-02`,...) to play with distributed systems like [K3S](https://k3s.io/).

## Requirements

* Ansible
* VirtualBox

## Usage

* Start VMs : `vagrant up`
* [Configure hostname resolution from host](docs/resolv-hostname.md)

```bash
ansible-playbook -i inventory configure-host.yml --ask-become-pass
```

* Clear SSH known_keys : `bash clear-ssh.sh`

* Check connectivity : `ansible -i inventory all -m ping`

* Configure VM : `ansible-playbook -i inventory configure-vm.yml`

* Configure HOST : `ansible-playbook -i inventory configure-host.yml --ask-become-pass`



## K3S Kubernetes cluster

Start [K3S](https://k3s.io/) :

```bash
bash start-k3s.sh
```

Usage infos will be displayed :

```bash
export KUBECONFIG=$PWD/.k3s/config
kubectl cluster-info
```

## See also

* [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)
