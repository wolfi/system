#!/bin/sh

SCRIPT_DIR=$(pwd)

# Source utility functions required for the setup
source utils/packages.sh

# Basics
source jobs/ssh.sh
source jobs/git.sh
# source jobs/yay.sh
source jobs/base.sh
source jobs/dotfiles.sh
source jobs/terminal.sh
# source jobs/mail.sh

# Dev
source jobs/containerization.sh
source jobs/development.sh

# Desktop environment
source jobs/desktop.sh
source jobs/pkms.sh
source jobs/themes.sh
source jobs/fonts.sh
source jobs/software.sh
source jobs/gaming.sh

# Cleanup job at the end
source jobs/cleanup.sh
