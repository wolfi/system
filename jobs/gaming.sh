# Install basic utilities
echo -e "\e[32m[Gaming]\e[0m Installing gaming apps..."

GAMING_APPS=(
  steam
)
install_zypper "${GAMING_APPS[@]}"

FLATPAK_GAMING_APPS=(
  com.heroicgameslauncher.hgl
)
install_flatpak "${FLATPAK_GAMING_APPS[@]}"
