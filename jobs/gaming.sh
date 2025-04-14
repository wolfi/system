# Install basic utilities
echo -e "\e[32m[Gaming]\e[0m Installing gaming apps..."

GAMING_APPS=(
  steam
)
install_pacman "${GAMING_APPS[@]}"

AUR_GAMING_APPS=(
  heroic-games-launcher-bin
)
install_pacman "${GAMING_APPS[@]}"
