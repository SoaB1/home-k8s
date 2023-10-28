#!/bin/bash

# Install dependencies
apt-get install -y software-properties-common sshpass

# Add Ansible and Git PPA
add-apt-repository --yes --update ppa:ansible/ansible
add-apt-repository --yes --update ppa:git-core/ppa
apt-get update

# Install git
apt-get install -y git

# Install Ansible
apt-get install -y ansible

git clone -b main https://github.com/SoaB1/home-k8s.git "${HOME}/home-k8s"

export ANSIBLE_CONFIG="${HOME}/home-k8s/ansible/ansible.cfg"

ansible-galaxy role install -r "${HOME}/home-k8s/ansible/requirements.yml"
ansible-galaxy collection install -r "${HOME}/home-k8s/ansible/requirements.yml"
ansible-playbook -i "${HOME}/home-k8s/ansible/inventories/hosts.yaml" "${HOME}/home-k8s/ansible/site.yaml"
