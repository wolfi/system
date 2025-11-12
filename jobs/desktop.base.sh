# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing base packages..."

DESKTOP=(
  foot
  mpd # Music Player Daemon
  mpv # Media player
  obs-studio
  obs-vkcapture
  obs-backgroundremoval
)

install_zypper "${DESKTOP[@]}"
