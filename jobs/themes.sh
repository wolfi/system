echo -e "\e[32m[Themes]\e[0m Installing GTK, icon and cursor themes..."

THEMES=(
  adapta-gtk-theme
  arc-icon-theme
  papirus-icon-theme
)

install_pacman "${THEMES[@]}"
