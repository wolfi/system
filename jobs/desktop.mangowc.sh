# Install desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing MangoWC..."

MANGOWC_DEPS=(
  Mesa-libEGL-devel
  Mesa-libGLESv2-devel
  glslang-devel
  hwdata
  libdisplay-info-devel
  libdrm-devel
  libdrm-tools
  libgbm-devel
  libinput-devel
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
  udev
  wayland-devel
  wayland-protocols-devel
  xwayland-devel
  liblcms2-devel
  seatd-devel
  xcb-util-renderutil-devel
  xcb-util-wm-devel
  xcb-util-errors-devel
  cairo-devel
)

install_zypper "${MANGOWC_DEPS[@]}"

# Vulkan build depencies
sudo zypper in -y -t pattern devel_vulkan
