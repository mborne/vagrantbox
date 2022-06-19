#!/bin/bash

VAGRANTBOX_NUM_NODES=${VAGRANTBOX_NUM_NODES:=3}
VAGRANTBOX_NETWORK="${VAGRANTBOX_NETWORK:=192.168.50}"

for i in $(seq 1 ${VAGRANTBOX_NUM_NODES});
do
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "vagrantbox-$i"
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "${VAGRANTBOX_NETWORK}.20$i"
done
