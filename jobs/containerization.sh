# Install basic utilities
echo -e "\e[32m[Containerization]\e[0m Installing..."

CONTAINERIZATION_UTILS=(
  docker
  docker-compose
)
install_pacman "${CONTAINERIZATION_UTILS[@]}"

sudo systemctl enable docker.service --now

AUR_CONTAINERIZATION_UTILS=(
  docker-rootless-extras
)
install_aur "${AUR_CONTAINERIZATION_UTILS[@]}"

# Create subuid
if [ ! -f "/etc/subuid" ]; then
  echo "$USER:231072:65536" >/etc/subuid
fi

# Create subgid
if [ ! -f "/etc/subgid" ]; then
  echo "$USER:231072:65536" >/etc/subgid
fi

# sudo systemctl --user enable docker.socket.service --now
