echo "[AUR Packages] Start"

source aur_packages.conf

install_packages() {
  local packages=("$@")
  yes | yay --noconfirm -S "${packages[@]}"
}

echo -e "\e[32m[INSTALL]\e[0m Installing general tools..."
install_packages "${GENERAL_TOOLS[@]}"

echo -e "\e[32m[INSTALL]\e[0m Installing development tools..."
install_packages "${DEV_TOOLS[@]}"

echo -e "\e[32m[INSTALL]\e[0m Installing themes..."
install_packages "${THEMES[@]}"

echo -e "\e[32m[INSTALL]\e[0m Installing communication tools..."
install_packages "${COMMUNICATION_TOOLS[@]}"

echo -e "\e[32m[INSTALL]\e[0m Installing work tools..."
install_packages "${WORK_TOOLS[@]}"

echo -e "\e[32m[INSTALL]\e[0m Installing media tools..."
install_packages "${MEDIA_TOOLS[@]}"

echo -e "\e[32m[INSTALL]\e[0m Installing gaming tools..."
install_packages "${GAMING[@]}"

echo "[AUR Packages] All packages installed"
