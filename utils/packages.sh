install_pacman() {
  local packages=("$@")
  sudo sudo pacman -S --needed --noconfirm "${packages[@]}"
}

install_aur() {
  local packages=("$@")
  yes | yay --needed --noconfirm -S "${packages[@]}"
}

install_zypper() {
  local packages=("$@")
  sudo zypper in -y "${packages[@]}"
}

install_flatpak() {
  local packages=("$@")
  sudo flatpack install -y "${packages[@]}"
}
