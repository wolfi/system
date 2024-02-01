#!/bin/sh

# Install Python first
sudo pacman -Sy --noconfirm python python-pipx

# Install Ansible
export PATH="$HOME/.local/bin:$PATH"
pipx install --include-deps ansible
ansible-galaxy collection install community.general kewlfft.aur

# Run playbook
ansible-playbook --ask-vault-pass local.yml
