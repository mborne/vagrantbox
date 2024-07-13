# Using vagrantbox on windows

It is **easier to use vagrantbox with VirtualBox on an Ubuntu host**. Meanwhile Ansible provisionning is disabled in vagrant to avoid the requirement to install ansible on windows and make it **possible to work with a windows host**.

## Using an ubuntu VM

* Create an [ubuntu-desktop](https://ubuntu.com/download/desktop) VirtualBox VM (`devbox`)
* Mount windows folder containing `vagrantbox` in the VM.
* Add `192.168.50.0/24` network to `devbox` VM
* Use `vagrant` on windows to start `vagrantbox` VMs
* Use `ansible` on linux `devbox` to configure `vagrantbox` VMs

## Using WSL2 and KVM

See :

* [mborne/toolbox - WSL2](https://github.com/mborne/toolbox/tree/master/wsl#readme)
* [mborne/toolbox - KVM](https://github.com/mborne/toolbox/tree/master/kvm#readme)


