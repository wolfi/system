# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing packages..."

DESKTOP=(
  bluez
  bluez-utils
  ffmpeg
  foot
  lxappearance
  mpv
  poppler
  riverwm
  rofi
  swaylock
  thunar
  thunar-archive-plugin
  thunar-volman
  wezterm
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
)

install_pacman "${DESKTOP[@]}"

# Create user dirs
xdg-user-dirs-update --force

# Enable bluetooth
echo -e "\e[32m[Desktop]\e[0m Enable bluetooth service..."
sudo systemctl enable bluetooth.service --now

# TODO: lua lua-posix wlr-randr swaybg swayidle swaylock wlroots wl-clipboard waybar wofi foot mako grim slurp wf-recorder light yad thunar geany mpv mpd mpc viewnior imagemagick xfce-polkit xorg-xwayland xdg-desktop-portal-wlr playerctl pastel python-pywal rofi pulsemixer
