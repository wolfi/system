#!/bin/sh

# Install the required system packages first
source jobs/install_packages.sh

# Run all jobs
source jobs/yay.sh
source jobs/ssh.sh
source jobs/git.sh
