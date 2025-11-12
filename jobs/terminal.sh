# Packages required and other CLI tools
echo -e "\e[32m[Terminal]\e[0m Installing required packages and tools..."
CLI_TOOLS=(
  ImageMagick
  bat
  bc
  bind
  btop
  curl
  fd
  fwupd
  fzf
  gum
  htop
  nano
  newsboat
  opi
  python312-pulsemixer
  ripgrep
  tealdeer
  tmux
  traceroute
  tree
  unzip
  wget
  whois
  yazi
  zoxide
  zsh
)

install_zypper "${CLI_TOOLS[@]}"

# ZSH
echo -e "\e[32m[ZSH]\e[0m Setting up ZSH..."
if [ ! -d "$HOME/.antidote" ]; then
  git clone https://github.com/mattmc3/antidote.git $HOME/.antidote
  zsh $HOME/.antidote/antidote bundle <$HOME/.dotfiles/zsh/.zsh_plugins.txt >~/.zsh_plugins.sh
  chsh -s $(which zsh) $USER
else
  echo -e "\e[32m[ZSH]\e[0m Already set up, skipping"
fi

# tmux
echo -e "\e[32m[tmux]\e[0m Install plugin manager TPM..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
else
  echo -e "\e[32m[tmux]\e[0m Already set up, skipping"
fi
