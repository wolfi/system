echo -e "\e[32m[Development]\e[0m Installing python..."
PYTHON=(
  pyenv
)
install_pacman "${PYTHON[@]}"

echo -e "\e[32m[Development]\e[0m Installing golang..."
GOLANG=(
  go
  gopls
  templ
)
install_pacman "${GOLANG[@]}"
