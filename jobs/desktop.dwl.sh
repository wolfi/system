# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing DWL..."

# Install wlroots
source desktop.wlroots.sh

cd $SCRIPT_DIR

# Build dwl
git clone -b wlroots-next https://codeberg.org/schwibbles/dwl.git /tmp/dwl
cd /tmp/dwl
make
sudo make install
rm -rf /tmp/dwl

cd $SCRIPT_DIR

TOOLS=(
  bluez
  brightnessctl
  grim # Screenshot utility for Wayland
  lua54-luaposix
  lxappearance
  maim # Screenshotting utility
  mako # Notification daemon for Wayland
  pamixer
  pastel # Color picker for Wayland
  pipewire
  playerctl
  poppler-tools # PDF rendering library
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
  wf-recorder # Screen recorder for Wayland
  wl-clipboard
  wlr-randr # Output configuration utility for Wayland
  wlsunset  # Day/night gamma adjuster for Wayland
  wmenu
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
  xwayland
)

install_zypper "${TOOLS[@]}"
