# Deploy K3S

Deploy a [K3S](https://k3s.io/) DEV cluster on vagrantbox VMs.

## Usage

* Install K3S on master node (vagrantbox-1)

```bash
ansible-playbook -i inventory k3s-master.yml
```

* Configure KUBECONFIG according to help displaying path to `vagrantbox/.k3s/k3s.yaml`

* Wait for master to be ready

```bash
kubectl wait --all-namespaces=true --for=condition=Ready pods  --timeout=60s --all
watch kubectl get nodes -o wide
```

```bash
ansible-playbook -i inventory k3s-agent.yml
```

## Have fun with kubernetes...

* [kubernetes.io](https://kubernetes.io/)
* [container.training](https://container.training/)

## Uninstall K3S

```bash
# uninstall k3s on agent nodes
ansible -i inventory k3s_agent -m shell -a "k3s-agent-uninstall.sh" --become
# uninstall k3s on master node
ansible -i inventory k3s_master -m shell -a "k3s-uninstall.sh" --become
```

## Notes

* Playbook is based on `curl -sfL https://get.k3s.io | sh -s -`.
* Playbook is not intented to be used for production.
* Playbook is configured throw the following files :

  * [inventory/group_vars/all/k3s.yml](inventory/group_vars/all/k3s.yml)
  * [inventory/group_vars/k3s_master/k3s.yml](inventory/group_vars/k3s_master/k3s.yml)
  * [inventory/group_vars/k3s_agent/k3s.yml](inventory/group_vars/k3s_agent/k3s.yml)

* Traefik is disabled (`--disable traefik`) as it is a good exercise to understand its deployment under kubernetes

* `--flannel-iface=eth1` is important as `eth0` is NAT network created by vagrant (see [stackoverflow.com - Is there any way to bind K3s / flannel to another interface?](https://stackoverflow.com/questions/66449289/is-there-any-way-to-bind-k3s-flannel-to-another-interface/66495119#66495119))




