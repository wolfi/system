echo -e "\e[32m[Development]\e[0m Setting up dirs..."
mkdir -p $HOME/personal
mkdir -p $HOME/work

echo -e "\e[32m[Development]\e[0m Installing n..."
if ! command -v n &>/dev/null; then
  git clone https://github.com/tj/n.git /tmp/n
  cd /tmp/n
  PREFIX=$HOME/.local/n make install

  # Install latest node LTS
  N_PREFIX=$HOME/.local/n $HOME/.local/n/bin/n lts

  # Enable pnpm
  export PATH=$PATH:$HOME/.local/n/bin corepack enable pnpm

  # Clean up
  rm -rf /tmp/n
fi

echo -e "\e[32m[Development]\e[0m Installing python..."
PYTHON=(
  pyenv
)
install_pacman "${PYTHON[@]}"

echo -e "\e[32m[Development]\e[0m Installing golang..."
PACMAN_GOLANG=(
  go
  gopls
)
install_pacman "${PACMAN_GOLANG[@]}"
AUR_GOLANG=(
  templ
)
install_aur "${AUR_GOLANG[@]}"

echo -e "\e[32m[Development]\e[0m Installing rust..."
if ! command -v cargo &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o /tmp/rustup.sh
  chmod +x /tmp/rustup.sh
  /tmp/rustup.sh -y
fi

echo -e "\e[32m[Development]\e[0m Installing neovim..."
NEOVIM=(
  luarocks
  neovim
  python-pip
  python-pynvim
  tree-sitter
  tree-sitter-cli
  wl-clipboard
)
install_pacman "${NEOVIM[@]}"

# Install neovim npm package
PATH="$HOME/.local/n/bin:$PATH" npm install -g neovim

# Install neovim plugins
nvim --headless "+Lazy! sync" +qa
