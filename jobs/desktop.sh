# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing packages..."

DESKTOP=(
  bluez
  bluez-utils
  brightnessctl
  ffmpeg
  foot
  grim # Screenshot utility for Wayland
  lua54-luaposix
  lxappearance
  maim # Screenshotting utility
  mako # Notification daemon for Wayland
  mpd  # Music Player Daemon
  mpv  # Media player
  obs-studio
  obs-vkcapture
  obs-backgroundremoval
  pamixer
  pastel # Color picker for Wayland
  playerctl
  poppler-tools # PDF rendering library
  river
  rofi-wayland
  slurp # Select region utility for Wayland
  swaybg
  swayidle
  swaylock
  thunar
  thunar-archive-plugin
  thunar-volman
  viewnior # Fast image viewer
  waybar
  wezterm
  wf-recorder # Screen recorder for Wayland
  wl-clipboard
  wlr-randr # Output configuration utility for Wayland
  wlsunset  # Day/night gamma adjuster for Wayland
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
  xwayland
)

install_zypper "${DESKTOP[@]}"

# Create user dirs
xdg-user-dirs-update --force

# Enable bluetooth
echo -e "\e[32m[Desktop]\e[0m Enable bluetooth service..."
sudo systemctl enable bluetooth.service --now

# Install ly
# LY_DEPS=(
#  pam-devel
#  libxcb-devel
#)
#install_zypper "${LY_DEPS[@]}"

# TODO: wlsunset lua lua-posix wlr-randr swaybg swayidle swaylock wlroots wl-clipboard waybar wofi foot mako grim slurp wf-recorder light yad thunar geany mpd mpc viewnior imagemagick xfce-polkit xorg-xwayland xdg-playerctl pastel python-pywal rofi pulsemixer

# TODO rofi:
# * bluetooth
# * launcher
# * music (mpc)
# * power
