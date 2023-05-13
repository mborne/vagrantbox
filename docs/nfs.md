# NFS

## Requirements

* [add-disk](add-disk.md) - Dedicated disk (`/dev/sdc`)

## Install NFS server

```bash
sudo apt-get update
sudo apt-get install -y nfs-kernel-server
sudo mkdir /var/nfs-data
sudo chown vagrant:vagrant /var/nfs-data
echo "/var/nfs-data *(rw,sync,no_subtree_check)" | sudo tee /etc/exports
sudo service nfs-kernel-server restart
showmount -e
```

## Mount NFS share

```bash
# from vagrantbox-2
sudo apt-get update
sudo apt-get install -y nfs-common
sudo mkdir -p /mnt/nfs-vagrantbox1
showmount -e 192.168.50.201
sudo mount -t nfs 192.168.50.201:/var/nfs-data /mnt/nfs-vagrantbox1/

# compare speed
dd if=/dev/zero of=/tmp/test.bin bs=1024 count=1000000
time sha256sum /tmp/test.bin

dd if=/dev/zero of=/mnt/nfs-vagrantbox1/test.bin bs=1024 count=1000000
time sha256sum /mnt/nfs-vagrantbox1/test.bin
```

