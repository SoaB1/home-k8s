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
