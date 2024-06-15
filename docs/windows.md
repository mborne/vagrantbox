# Using vagrantbox on windows

It is **easier to use vagrantbox with VirtualBox on an Ubuntu host**. Meanwhile Ansible provisionning is disabled in vagrant to avoid the requirement to install ansible on windows and make it **possible to work with a windows host**.

## Using an ubuntu VM

* Create an [ubuntu-desktop](https://ubuntu.com/download/desktop) VirtualBox VM (`devbox`)
* Mount windows folder containing `vagrantbox` in the VM.
* Add `192.168.50.0/24` network to `devbox` VM
* Use `vagrant` on windows to start `vagrantbox` VMs
* Use `ansible` on linux `devbox` to configure `vagrantbox` VMs

## Using WSL2 and KVM

The following approach now works :

* Install WSL2 on windows with an Ubuntu-22.04
* Edit `/etc/wsl2.conf` to allow KVM :

```conf
[boot]
systemd=true
kernelCommandLine=amd_iommu=on iommu=pt kvm.ignore_msrs=1 kvm-amd.nested=1 kvm-amd.ept=1 kvm-amd.emulate_invalid_guest_state=0 kvm-amd.enable_shadow_vmcs=1 kvm-amd.enable_apicv=1

[wsl2]
nestedVirtualization=true
```

* Restart WSL :

```bash
wsl --shutdown
wsl
```

* Use [KVM with and libvirt-provider](kvm.md)
