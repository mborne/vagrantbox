# Resolve hostname from host

## /etc/hosts

Add this lines to `/etc/hosts` :

```
192.168.30.101 vagrantbox-01
192.168.30.102 vagrantbox-02
192.168.30.101 vagrantbox traefik.vagrantbox longhorn.vagrantbox
```

## dnsmasq

### 1) Make it work with systemd-resolved

* `/etc/dnsmasq.conf` to configure a custom listen IP :

```conf
listen-address=127.0.0.2
bind-interfaces
```

* `/etc/systemd/resolved.conf` to use dnsmasq :

```conf
[Resolve]
DNS=127.0.0.2
Domains=*
```

### 2) Samples

* `/etc/dnsmasq.d/01-vagrantbox.conf`

```ini
address=/.vagrantbox.dev/192.168.30.101
```

* `/etc/dnsmasq.d/99-forward.conf` to forward to external DNS :

```ini
server=1.1.1.1
server=1.0.0.1
```

* `/etc/dnsmasq.d/88-kube.conf`

```ini
server=/cluster.local/10.43.0.10
```
