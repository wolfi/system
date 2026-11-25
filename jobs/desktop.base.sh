# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing base packages..."

DESKTOP=(
  flatpak
  flatpak-zsh-completion
  foot
  fuzzel
  keyd
  # mpd # Music Player Daemon
  mpv # Media player
  obs-backgroundremoval
  obs-studio
  obs-vkcapture
  wqy-zenhei-fonts # Chinese character support
  xdg-user-dirs
)

install_zypper "${DESKTOP[@]}"

# Add keyd config to remap mouse buttons 1 and 2
sudo echo "[ids]

*
04a5:8005:f618ad6b

[main]

mouse1 = leftshift
mouse2 = leftcontrol" >/etc/keyd/default.conf

sudo systemctl enable keyd
