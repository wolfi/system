# Install umbriel desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing umbriel build dependencies..."

# Install wlroots
cd $SCRIPT_DIR
source jobs/desktop.wlroots.sh

  # Mesa-libEGL-devel
  # Mesa-libGLESv2-devel
  # cairo-devel
  # glslang-devel
  # hwdata
  # libdisplay-info-devel
  # libdrm-devel
  # libdrm-tools
  # libgbm-devel
  # libinput-devel
  # liblcms2-devel
  # libliftoff-devel
  # libpixman-1-0-devel
  # libseat1
  # libxcb-devel
  # libxcb-errors0
  # libxcb-render-util0
  # libxkbcommon-devel
  # meson
  # meson-vim
  # seatd
  # seatd-devel
  # udev
  # wayland-devel
  # wayland-protocols-devel
  # xcb-util-errors-devel
  # xcb-util-renderutil-devel
  # xcb-util-wm-devel
  # xwayland-devel


# Install a C++23 compiler, Meson, Ninja, Just, pkg-config, wayland-scanner, and development packages for wlroots 0.20 (0.20.1 or newer, built with Xwayland support), Wayland, wayland-protocols, xkbcommon, libinput, pixman, libdrm, libdisplay-info, EGL, GLES2, GBM, Pango, tomlplusplus, nlohmann-json, xcb, xcb-icccm, and xcb-ewmh. Native [drm] GPU exclusions also require libudev. lcms2 is optional.

UMBRIEL=(
  # Desktop
  hyprwayland-scanner
  just
  liblcms2-devel
  libpixman-1-0-devel
  libwaylandpp1
  libxcb-ewmh2
  libxcb-icccm4
  libxkbcommon0
  ninja
  nlohmann_json-devel
  pango-devel
  tomlplusplus-devel

  # XDG Portal
  gtk4-devel
  libwayland-client0
  pipewire
  pipewire-devel
  sdbus-cpp-devel
)

install_zypper "${UMBRIEL[@]}"

cd $SCRIPT_DIR

# Build umbriel
$BUILDPATH=/tmp/umbriel
git clone -b main https://github.com/noctalia-dev/umbriel.git $BUILDPATH
cd $BUILDPATH
just release
sudo just install
rm -rf $BUILDPATH

# Build xdg-desktop-portal-umbriel
BUILDPATH=/tmp/xdg-desktop-portal-umbriel
git clone -b main https://github.com/noctalia-dev/xdg-desktop-portal-umbriel.git $BUILDPATH
cd $BUILDPATH
just configure
just build
just release
sudo just install
rm -rf $BUILDPATH

# Install noctalia
NOCTALIA=(
   noctalia
   noctalia-qs
   noctalia-shell
)

install_zypper "${NOCTALIA[@]}"
