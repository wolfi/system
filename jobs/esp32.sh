echo -e "\e[32m[ESP32]\e[0m ESP32 dev tools and environment..."

# Add user to dialout group to grant rw access to the serial port over USB
usermod -a -G dialout $USER

echo -e "\e[32m[ESP32]\e[0m Installing EIM CLI..."
if ! command -v eim &>/dev/null; then
  EIM_VERSION=v0.12.0
  DL_TARGET=/tmp/eim-cli-linux-x64.zip

  curl --proto '=https' --tlsv1.2 -sSf https://dl.espressif.com/github_assets/espressif/idf-im-ui/releases/download/$EIM_VERSION/eim-cli-linux-x64.zip -o $DL_TARGET
  unzip $DL_TARGET -d $HOME/.local/bin
fi

echo -e "\e[32m[ESP32]\e[0m Installing ESP-IDF dependencies..."
DEPS=(
  bison
  ccache
  dfu-util
  flex
  glib2
  gperf
  libSDL2-2_0-0
  libffi-devel
  libgcrypt20
  libopenssl-devel
  libslirp0
  libusb-1_0-0
  libpixman-1-0
)
install_zypper "${DEPS[@]}"

echo -e "\e[32m[ESP32]\e[0m Installing ESP-IDF..."
eim install

echo -e "\e[32m[ESP32]\e[0m Installing basic dev tools..."
TOOLS=(
  tio
)
install_zypper "${TOOLS[@]}"
