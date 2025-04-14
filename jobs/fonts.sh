echo -e "\e[32m[Fonts]\e[0m Installing all the fonts..."

PACMAN_FONTS=(
  otf-droid-nerd
  otf-firamono-nerd
  ttf-3270-nerd
  ttf-cascadia-code-nerd
  ttf-fantasque-nerd
  ttf-firacode-nerd
  ttf-font-awesome
  ttf-hack-nerd
  ttf-iosevkaterm-nerd
  ttf-jetbrains-mono-nerd
  ttf-joypixels
  ttf-nerd-fonts-symbols
  ttf-nerd-fonts-symbols-common
  ttf-nerd-fonts-symbols-mono
  ttf-noto-nerd
  ttf-roboto
  ttf-roboto-mono-nerd
)
install_pacman "${PACMAN_FONTS[@]}"

AUR_FONTS=(
  ttf-joypixels
)

install_aur "${AUR_FONTS[@]}"
