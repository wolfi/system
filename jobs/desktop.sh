# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing packages..."

DESKTOP=(
  bluez
  bluez-utils
  brightnessctl
  ffmpeg
  foot
  grim # Screenshot utility for Wayland
  imagemagick
  lua
  lua-posix
  lxappearance
  ly
  mako # Notification daemon for Wayland
  mpd  # Music Player Daemon
  mpv  # Media player
  pamixer
  pastel # Color picker for Wayland
  playerctl
  poppler      # PDF rendering library
  python-pywal # Wallpaper and color utilities
  river
  rofi
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
  wlroots
  wlsunset # Day/night gamma adjuster for Wayland
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
  xorg-xwayland
  yad # Display dialogs from shell scripts
)

install_pacman "${DESKTOP[@]}"

# Create user dirs
xdg-user-dirs-update --force

# Enable bluetooth
echo -e "\e[32m[Desktop]\e[0m Enable bluetooth service..."
sudo systemctl enable bluetooth.service --now

# TODO: wlsunset lua lua-posix wlr-randr swaybg swayidle swaylock wlroots wl-clipboard waybar wofi foot mako grim slurp wf-recorder light yad thunar geany mpd mpc viewnior imagemagick xfce-polkit xorg-xwayland xdg-playerctl pastel python-pywal rofi pulsemixer

# TODO rofi:
# * bluetooth
# * launcher
# * music (mpc)
# * power
