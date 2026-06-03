# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing DWL..."

WLROOTS_VERSION=0.20.1

WLROOTS_DEPS=(
  Mesa-libEGL-devel
  Mesa-libGLESv2-devel
  cairo-devel
  glslang-devel
  hwdata
  libdisplay-info-devel
  libdrm-devel
  libdrm-tools
  libgbm-devel
  libinput-devel
  liblcms2-devel
  libliftoff-devel
  libpixman-1-0-devel
  libseat1
  libxcb-devel
  libxcb-errors0
  libxcb-render-util0
  libxkbcommon-devel
  meson
  meson-vim
  seatd
  seatd-devel
  udev
  wayland-devel
  wayland-protocols-devel
  xcb-util-errors-devel
  xcb-util-renderutil-devel
  xcb-util-wm-devel
  xwayland-devel
)

install_zypper "${WLROOTS_DEPS[@]}"

# Vulkan build depencies
sudo zypper in -y -t pattern devel_vulkan

# Build wlroots
git clone -b $WLROOTS_VERSION https://gitlab.freedesktop.org/wlroots/wlroots.git /tmp/wlroots
cd /tmp/wlroots
meson build -Dprefix=/usr
sudo ninja -C build install
rm -rf /tmp/wlroots

cd $SCRIPT_DIR

# Build dwl
git clone https://codeberg.org/schwibbles/dwl.git /tmp/dwl
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
