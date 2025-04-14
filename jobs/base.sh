# Install basic utilities
echo -e "\e[32m[Basics]\e[0m Installing base utilities..."

SYSTEM_UTILS=(
  base-devel
  cmake
  mkcert
  python
  python-pipx
)

install_pacman "${SYSTEM_UTILS[@]}"
