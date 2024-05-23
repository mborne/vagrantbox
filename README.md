# vagrantbox

Create some virtual machines with [Vagrant](https://developer.hashicorp.com/vagrant) and [Ansible](https://docs.ansible.com/).

## Motivation

This repository aims at providing a playground :

* To install distributed systems like [K3S](https://github.com/mborne/k3s-deploy#k3s-deploy)
* To illustre the use of Vagrant and Ansible in [mborne/cours-devops (French)](https://github.com/mborne/cours-devops#readme) 

## Requirements

* **VirtualBox** or [KVM](docs/kvm.md)
* **Vagrant** to start VM (see [developer.hashicorp.com - Install Vagrant](https://developer.hashicorp.com/vagrant/downloads))
* **Ansible** to configure host and VM (see [docs.ansible.com - Installing Ansible on Ubuntu](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu))
* Optional (http proxy) : `vagrant plugin install vagrant-proxyconf` to forward `HTTP_PROXY`, `HTTPS_PROXY` and `NO_PROXY`.

## Parameters

See supported env vars in [Vagrantfile](Vagrantfile) :

| Name                   | Description                                                             | Default value      |
| ---------------------- | ----------------------------------------------------------------------- | ------------------ |
| `VAGRANTBOX_BOX`       | Base image from [Vagrant Cloud](https://app.vagrantup.com/boxes/search) | `"ubuntu/jammy64"` |
| `VAGRANTBOX_NUM_NODES` | Number of VM                                                            | `4`                |
| `VAGRANTBOX_NETWORK`   | Network for VM                                                          | `"192.168.50"`     |
| `VAGRANTBOX_MEMORY`    | VM memory in Mo                                                         | `"2048"`           |

## Usage

### Vagrant

| Description               | Command                                                           |
| ------------------------- | ----------------------------------------------------------------- |
| Start VMs with VirtualBox | `vagrant up`                                                      |
| Start VMs with KVM        | `VAGRANTBOX_BOX=generic/ubuntu2204 vagrant up --provider=libvirt` |
| Check VM status           | `vagrant status`                                                  |
| Open a terminal in a VM   | `vagrant ssh vagrantbox-1`                                        |
| Destroy VMs               | `vagrant destroy -f`                                              |

(see also [gist.github.com - wpscholar/vagrant-cheat-sheet.md](https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4#file-vagrant-cheat-sheet-md))

### Ansible 

The following playbooks are available to configure guest and VMs :

| Name                                                         | Description                                                      |
| ------------------------------------------------------------ | ---------------------------------------------------------------- |
| [playbooks/quickstart.yml](playbooks/quickstart.yml)         | Apply the following playbooks                                    |
| [playbooks/configure-vm.yml](playbooks/configure-vm.yml)     | Add `~/.ssh/id_rsa.pub` and fill `/etc/hosts` on each VM         |
| [playbooks/clear-ssh.yml](playbooks/clear-ssh.yml)           | Update `~/.ssh/known_hosts` with SSH keys for the vagrantbox VMs |
| [playbooks/upgrade.yml](playbooks/upgrade.yml)               | Upgrade system package (`apt-get update && apt-get upgrade -y`)  |
| [playbooks/configure-host.yml](playbooks/configure-host.yml) | Fill `/etc/hosts` on VM's host (**optional**, see bellow)        |

You may use [playbooks/quickstart.yml](playbooks/quick-start.yml) as follow :

```bash
# /etc/hosts edition requires sudo
ansible-playbook -i inventory playbooks/quickstart.yml --ask-become-pass
# /etc/hosts edition can be disabled
ansible-playbook -i inventory playbooks/quickstart.yml -e configure_host_enabled=false
```

> See [quickstart demo](docs/quickstart-demo.md).


## License

[MIT](LICENSE)

## Ressources

* [Using vagrantbox on windows](docs/windows.md)
* [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)
