echo "[Install Packages] Start"

source aur_packages.conf

install_packages() {
  local packages=("$@")
  yes | yay --noconfirm -S "${packages[@]}"
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
