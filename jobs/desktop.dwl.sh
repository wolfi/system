# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing DWL..."

DWL_VERSION=v0.8
WLROOTS_VERSION=0.19.3

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

TOOLS=(
  pipewire
  waybar
  xdg-desktop-portal
  xdg-desktop-portal-wlr
)

install_zypper "${TOOLS[@]}"
