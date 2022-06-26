# vagrantbox

Vagrant helper to create some local VM (`vagrantbox-01`, `vagrantbox-02`,...) to play with distributed systems like [K3S](https://k3s.io/).

## Requirements

* VirtualBox or [KVM](docs/kvm.md)
* Optional : `vagrant plugin install vagrant-proxyconf` to forward HTTP_PROXY, HTTPS_PROXY and NO_PROXY.
* Ansible to configure host and VM

## Usage

* Start VMs : `vagrant up` or `vagrant up --provider=libvirt`
* Optional ([windows...](docs/windows.md)) : switch into a linux VM sharing `192.168.50.0/24` network.
* Configure host :

```bash
# clear ~/.ssh/known_host
ansible-playbook -i inventory clear-ssh.yml
# configure /etc/hosts
ansible-playbook -i inventory configure-host.yml --ask-become-pass
# check connectivity
ansible -i inventory all -m ping
```

* Configure VM :

```bash
# -e ansible_ssh_user=vagrant -e ansible_ssh_pass=vagrant
ansible-playbook -i inventory configure-vm.yml
```

* Optional : [Deploy K3S](k3s.md)

## License

[mborne/vagrantbox](https://github.com/mborne/vagrantbox) is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## See also

* [dnsmasq](docs/dnsmasq.md)
* [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)
