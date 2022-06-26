# Windows...

## Key points

* [WSL2 breaks VirtualBox 6.1](https://github.com/MicrosoftDocs/WSL/issues/798)
* Ansible provisionning is disabled in vagrant to avoid the requirement to install ansible on windows.

## It may work with KVM under WSL2...

[KVM](kvm.md), vagrant and [K3S](../k3s.md) works under WSL2 but it is not handy to access services from windows host... Tried things like :

* Disable windows firewall on WSL2 network
* Add a route on windows to `192.168.50.0/24` throw the dynamic WSL2 IP
* Resolve `whoami.localhost` as `192.168.50.201` on windows host
* ...

## It should work with KVM in a linux VirtualBox VM...

...but I'm facing kernel crashes with `generic/ubuntu2004` in KVM VM with nested virtualization.

## Current solution

* Create an [ubuntu-desktop](https://ubuntu.com/download/desktop) VirtualBox VM (`devbox`)
* Mount windows folder containing `vagrantbox` in the VM.
* Add `192.168.50.0/24` network to `devbox` VM
* Use `vagrant` on windows to start `vagrantbox` VMs
* Use `ansible` on linux `devbox` to configure `vagrantbox` VMs
