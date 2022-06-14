#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd ${SCRIPT_DIR}

SSH_OPTS="-o StrictHostKeyChecking=no"

# Install K3S on server node
ssh ${SSH_OPTS} vagrant@vagrantbox-1 "curl -sfL https://get.k3s.io | sh -s"

# Retrieve join token from server node
K3S_TOKEN=$(ssh ${SSH_OPTS} vagrant@vagrantbox-1 sudo cat /var/lib/rancher/k3s/server/node-token)

# Install K3S on others nodes
ssh ${SSH_OPTS} vagrant@vagrantbox-2 "curl -sfL http://get.k3s.io | K3S_URL=https://vagrantbox-1:6443 K3S_TOKEN=${K3S_TOKEN} sh -s -"
ssh ${SSH_OPTS} vagrant@vagrantbox-3 "curl -sfL http://get.k3s.io | K3S_URL=https://vagrantbox-1:6443 K3S_TOKEN=${K3S_TOKEN} sh -s -"
ssh ${SSH_OPTS} vagrant@vagrantbox-4 "curl -sfL http://get.k3s.io | K3S_URL=https://vagrantbox-1:6443 K3S_TOKEN=${K3S_TOKEN} sh -s -"
ssh ${SSH_OPTS} vagrant@vagrantbox-5 "curl -sfL http://get.k3s.io | K3S_URL=https://vagrantbox-1:6443 K3S_TOKEN=${K3S_TOKEN} sh -s -"

# Retrieve kubeconfig
mkdir -p .k3s
ssh ${SSH_OPTS} vagrant@vagrantbox-1 "sudo cat /etc/rancher/k3s/k3s.yaml" > .k3s/config
sed -i 's/127.0.0.1/vagrantbox-1/g' .k3s/config

echo "#----------------------------------------------------"
echo "#- Usage :"
echo "#----------------------------------------------------"
echo "export KUBECONFIG=$PWD/.k3s/config"
echo "kubectl cluster-info"
