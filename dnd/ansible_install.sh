#!/bin/bash


virtualenv venv
. venv/bin/activate
pip install ansible
cd /project

if [[ -n $K3S_INIT ]]; then
    ansible-playbook playbooks/site.yml -i dnd/inventory.yml
else
    echo Leaving container up for ansible control!
    while true; do sleep 15; done
fi
