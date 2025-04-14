echo -e "\e[32m[Software]\e[0m Installing apps..."

APPS=(
  blender
  gimp
  inkscape
  krita
  chromium
  firefox
  calibre
  zathura
  zathura-pdf-poppler
)

install_pacman "${APPS[@]}"
