#!/bin/bash

for i in $(seq 1 5);
do
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "vagrantbox-$i"
    ssh-keygen -f "$HOME/.ssh/known_hosts" -R "192.168.50.20$i"
done
