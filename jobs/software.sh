echo -e "\e[32m[Software]\e[0m Installing apps..."

APPS=(
  blender
  gimp
  inkscape
  krita
  chromium
  firefox
  calibre
  vivaldi
  zathura
  zathura-pdf-poppler
)

install_pacman "${APPS[@]}"

AUR_APPS=(
  signal-desktop
  teams-for-linux
  sesh-bin
  icaclient
)

install_aur "${AUR_APPS[@]}"
