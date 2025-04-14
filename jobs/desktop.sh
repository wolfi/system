# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing packages..."

DESKTOP=(
  bluez
  bluez-utils
  ffmpeg
  foot
  grim
  imagemagick
  lua
  lua-posix
  lxappearance
  ly
  mako
  mpd
  mpv
  pastel
  playerctl
  poppler
  python-pywal
  river
  rofi
  slurp
  swaybg
  swayidle
  swaylock
  thunar
  thunar-archive-plugin
  thunar-volman
  viewnior
  waybar
  wezterm
  wf-recorder
  wl-clipboard
  wlr-randr
  wlroots
  wlsunset
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
  xorg-xwayland
  yad
)

install_pacman "${DESKTOP[@]}"

AUR_DESKTOP=(
  light
)

install_aur "${AUR_DESKTOP[@]}"

# Create user dirs
xdg-user-dirs-update --force

# Enable bluetooth
echo -e "\e[32m[Desktop]\e[0m Enable bluetooth service..."
sudo systemctl enable bluetooth.service --now

# TODO: wlsunset lua lua-posix wlr-randr swaybg swayidle swaylock wlroots wl-clipboard waybar wofi foot mako grim slurp wf-recorder light yad thunar geany mpd mpc viewnior imagemagick xfce-polkit xorg-xwayland xdg-playerctl pastel python-pywal rofi pulsemixer
