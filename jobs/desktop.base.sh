# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing base packages..."

DESKTOP=(
  foot
  # mpd # Music Player Daemon
  mpv # Media player
  obs-studio
  obs-vkcapture
  obs-backgroundremoval
  flatpak
  flatpak-zsh-completion
  xdg-user-dirs
)

install_zypper "${DESKTOP[@]}"
