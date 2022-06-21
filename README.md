# vagrantbox

Vagrant helper to create some local VM (`vagrantbox-01`, `vagrantbox-02`,...) to play with distributed systems like [K3S](https://k3s.io/).

## Requirements

* VirtualBox or [KVM](docs/kvm.md)
* `vagrant plugin install vagrant-proxyconf` to forward HTTP_PROXY, HTTPS_PROXY and NO_PROXY (Optional).
* Ansible (Optional)

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

## License

[mborne/vagrantbox](https://github.com/mborne/vagrantbox) is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## See also

* [blog.christophersmart.com - Using a dynamic libvirt inventory with Ansible](https://blog.christophersmart.com/2022/04/03/using-a-dynamic-libvirt-inventory-with-ansible/)
