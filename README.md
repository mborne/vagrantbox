# vagrantbox

Vagrant helper with Ansible provisioning to create some local VM (`vagrantbox-01`, `vagrantbox-02`,...) to play with distributed systems like [K3S](https://k3s.io/).

## Requirements

* Ansible
* VirtualBox or [KVM](docs/kvm.md)
* Optional : `vagrant plugin install vagrant-proxyconf` to forward HTTP_PROXY, HTTPS_PROXY and NO_PROXY.

## Usage

* Start VMs : `vagrant up` or `vagrant up --provider=libvirt`
* Configure hostname resolution from host :
  * Option 1) `/etc/hosts` : `ansible-playbook -i inventory configure-host.yml --ask-become-pass`
  * Option 2) [dnsmasq](docs/dnsmasq.md)
* Clear SSH known_keys : `bash clear-ssh.sh`
* Check connectivity : `ansible -i inventory all -m ping`
* Configure VM :

```bash
ansible-playbook -i inventory configure-vm.yml
# on failure
ansible-playbook -i inventory configure-vm.yml -e ansible_ssh_user=vagrant -e ansible_ssh_pass=vagrant
```

## See also

* [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)
