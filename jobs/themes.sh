echo -e "\e[32m[Themes]\e[0m Installing GTK, icon and cursor themes..."

PACMAN_THEMES=(
  adapta-gtk-theme
  arc-icon-theme
  papirus-icon-theme
)

install_pacman "${PACMAN_THEMES[@]}"

AUR_THEMES=(
  matcha-gtk-theme
  qogir-gtk-theme
  qogir-icon-theme
  qogir-cursor-theme
  tela-circle-icon-theme-all
)

install_aur "${AUR_THEMES[@]}"
