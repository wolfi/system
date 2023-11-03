#!/bin/sh

# Install Python first
sudo xbps-install -Su python3 python3-pipx

# Install Ansible
export PATH="$HOME/.local/bin:$PATH"
pipx install --include-deps ansible

# Run playbook
ansible-playbook --ask-vault-pass local.yml
