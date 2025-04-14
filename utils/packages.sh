install_pacman() {
  local packages=("$@")
  sudo sudo pacman -S --needed --noconfirm "${packages[@]}"
}

install_aur() {
  local packages=("$@")
  yes | yay --needed --noconfirm -S "${packages[@]}"
}
