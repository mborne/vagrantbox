# vagrantbox

Vagrant helper to create some local VM to play with distributed systems like [K3S](https://github.com/mborne/k3s-deploy#k3s-deploy).

## Requirements

* VirtualBox or [KVM](docs/kvm.md)
* Ansible to deploy configure host and VM
* Optional (http proxy) : `vagrant plugin install vagrant-proxyconf` to forward `HTTP_PROXY`, `HTTPS_PROXY` and `NO_PROXY`.

## Parameters

See supported env vars in [Vagrantfile](Vagrantfile).

## Usage

### Starting VM with Vagrant

```bash
# With default provider (VirtualBox)
vagrant up
# or with KVM :
# vagrant up --provider=libvirt
```

### Configure host with Ansible

```bash
# clear ~/.ssh/known_host
ansible-playbook -i inventory clear-ssh.yml
# configure /etc/hosts
ansible-playbook -i inventory configure-host.yml --ask-become-pass
# check connectivity
ansible -i inventory all -m ping
```

### Configure VM with Ansible

Use [configure-vm.yml](configure-vm.yml) to add your public key to vagrant user and configure `/etc/hosts` :

```bash
ansible-playbook -i inventory configure-vm.yml
```

## License

[MIT](LICENSE)

## Ressources

* [Using vagrantbox on windows](docs/windows.md)
* [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)
* [dnsmasq](docs/dnsmasq.md)
