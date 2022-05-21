# KVM - ubuntu 20.04 setup notes

* 1) Install KVM

```bash
# KVM
sudo apt -y install qemu libvirt-daemon-system libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables dnsmasq-base

sudo apt -y install virt-top libguestfs-tools libosinfo-bin  qemu-system virt-manager
```

```bash
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
```

```bash
sudo apt install libvirt-daemon-driver-lxc
sudo systemctl restart libvirtd
```

* 2) Ensure the vhost_net module is loaded and enabled

```bash
sudo modprobe vhost_net
lsmod | grep vhost
```

* 3) Allow current user to use KVM

```bash
# User rights
sudo adduser $USER libvirt
```

* 4) Install graphical UI

```
sudo apt install virt-manager
```
