
# Start KVM

```bash
sudo chown root:kvm /dev/kvm
sudo chmod 660 /dev/kvm
sudo libvirtd &
sudo virtlogd &
```

TODO : see https://docs.microsoft.com/en-us/windows/wsl/wsl-config#boot-settings


* `/etc/resolv.conf`

```
nameserver 127.0.0.2
```

* `/etc/wsl.conf` :

```ini
[automount]
options = "metadata"

[network]
generateResolvConf = false
```

