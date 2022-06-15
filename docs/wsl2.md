
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




# Windows to WSL

> https://github.com/Microsoft/WSL/issues/1032
> https://argonsys.com/microsoft-cloud/library/windows-subsystem-for-linux-2-addressing-traffic-routing-issues/


```bash
Get-NetIPInterface | select ifIndex,InterfaceAlias,AddressFamily,ConnectionState,Forwarding | Sort-Object -Property IfIndex | Format-Table
Set-NetIPInterface -ifindex 24 -Forwarding Enabled
```

* Get WSL2 IP

> https://superuser.com/a/1676054

```bash
wsl -- ip -o -4 -json addr list eth0 `
| ConvertFrom-Json `
| %{ $_.addr_info.local } `
| ?{ $_ }
```


* Add route

route add 192.168.50.0 mask 255.255.255.0 172.18.78.22
route delete 192.168.50.0 mask 255.255.255.0

https://superuser.com/a/1553792