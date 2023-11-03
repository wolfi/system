#!/bin/sh

# Install Ansible first
xbps-install -Su python3 python3-pip
python3 -m pip install --user ansible

# Run playbook
