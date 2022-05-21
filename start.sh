#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd ${SCRIPT_DIR}

vagrant up --provider=libvirt

ssh-keygen -f "$HOME/.ssh/known_hosts" -R "vagrantbox-01"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "192.168.30.101"

ssh-keygen -f "$HOME/.ssh/known_hosts" -R "vagrantbox-02"
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "192.168.30.102"

