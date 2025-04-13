#!/bin/sh

# Install the required system packages first
source jobs/install_packages.sh

# Run all jobs
source jobs/yay.sh
source jobs/ssh.sh
source jobs/git.sh
source jobs/install_aur_packages.sh

# Cleanup job at the end
source jobs/cleanup.sh
