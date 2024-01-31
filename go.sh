#!/bin/sh

# Install Python first
sudo pacman -Su python3 python3-pipx

# Install Ansible
export PATH="$HOME/.local/bin:$PATH"
pipx install --include-deps ansible
ansible-galaxy collection install community.general

# Run playbook
ansible-playbook --ask-vault-pass local.yml
