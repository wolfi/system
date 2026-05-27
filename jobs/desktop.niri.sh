# Install niri desktop environment
echo -e "\e[32m[Desktop]\e[0m Installing niri packages..."

DESKTOP=(
  hwdata
  libdrm-tools
  libseat1
  libwaylandpp1
  libxcb-errors0
  libxcb-render-util0
  meson
  meson-vim
  niri
  niri-settings
  seatd
  udev
)

install_zypper "${DESKTOP[@]}"
