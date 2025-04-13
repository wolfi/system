echo "[Install Packages] Start"

# Source the configuration file
source packages.conf

# Update package cache
sudo pacman -Syy

# Function to install packages
install_packages() {
  local packages=("$@")
  sudo sudo pacman -S --noconfirm "${packages[@]}"
}

# Install system utilities
echo -e "\e[32m[INSTALL]\e[0m Installing system utilities..."
install_packages "${SYSTEM_UTILS[@]}"

# Install dev tools
echo -e "\e[32m[INSTALL]\e[0m Installing development tools..."
install_packages "${SYSTEM_UTILS[@]}"

# Install containerization tools
echo -e "\e[32m[INSTALL]\e[0m Installing containerization tools..."
install_packages "${SYSTEM_UTILS[@]}"

echo "[Install Packages] All packages installed"
