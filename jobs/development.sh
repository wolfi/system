echo -e "\e[32m[Development]\e[0m Installing dev utilities..."

DEV_UTILS=(
  templ
)

install_pacman "${DEV_UTILS[@]}"
