# Install basic utilities
echo -e "\e[32m[Containerization]\e[0m Installing..."

CONTAINERIZATION_UTILS=(
  docker
  docker-compose
)

install_pacman "${CONTAINERIZATION_UTILS[@]}"
