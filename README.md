# vagrantbox

Vagrant helper to create local VMs to play with distributed systems like [K3S](https://github.com/mborne/k3s-deploy#k3s-deploy).

## Requirements

* VirtualBox or [KVM](docs/kvm.md)
* Ansible to deploy configure host and VM
* Optional (http proxy) : `vagrant plugin install vagrant-proxyconf` to forward `HTTP_PROXY`, `HTTPS_PROXY` and `NO_PROXY`.

## Parameters

See supported env vars in [Vagrantfile](Vagrantfile).

## Usage

### Vagrant

| Description     | Command                                                            |
| --------------- | ------------------------------------------------------------------ |
| Start VMs       | `vagrant up` (VirtualBox) or `vagrant up --provider=libvirt` (KVM) |
| Check VM status | `vagrant status`                                                   |
| Connect to a VM | `vagrant ssh vagrantbox-1`                                         |
| Destroy VMs     | `vagrant destroy -f`                                               |

(see also [gist.github.com - wpscholar/vagrant-cheat-sheet.md](https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4#file-vagrant-cheat-sheet-md))

### Ansible

You may use `ansible-playbook -i inventory quick-start.yml --ask-become-pass` or perform the following steps :

### Configure localhost with Ansible

* Update `~/.ssh/known_host` on localhost : `ansible-playbook -i inventory clear-ssh.yml`

![clear-ssh result](docs/img/screenshot-clear-ssh.png)

* Check connectivity : `ansible -i inventory all -m ping`

![Screenshot connectivity](docs/img/screenshot-ping.png)

* Add `/etc/hosts` : `ansible-playbook -i inventory configure-host.yml --ask-become-pass`

### Configure VMs with Ansible

* Add your public key to vagrant user and configure `/etc/hosts` : `ansible-playbook -i inventory configure-vm.yml`

![Screenshot connectivity](docs/img/screenshot-configure-vm.png)

* Upgrade system packages :  `ansible-playbook -i inventory upgrade.yml`

## License

[MIT](LICENSE)

## Ressources

* [Using vagrantbox on windows](docs/windows.md)
* [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)
* [dnsmasq](docs/dnsmasq.md)
