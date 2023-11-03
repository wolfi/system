#!/bin/sh

# Install Python first
sudo xbps-install -Su python3 python3-pipx

# Install Ansible
pipx ensurepath
pipx install --include-deps ansible

# Run playbook
