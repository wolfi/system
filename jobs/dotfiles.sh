echo -e "\e[32m[dotfiles]\e[0m Installing required packages..."
REQUIRED_UTILS=(
  stow
  acl
)
install_pacman "${REQUIRED_UTILS[@]}"

# Clone dotfiles repo
echo -e "\e[32m[dotfiles]\e[0m Cloning dotfiles..."
DOTFILES_DIR=$HOME/.dotfiles
if [ ! -d "$DOTFILES_DIR" ]; then
  git clone git@github.com:wolfi/dotfiles.git $DOTFILES_DIR
else
  echo -e "\e[32m[dotfiles]\e[0m Already exists, skipping"
fi

# Stow
rm $HOME/.zshrc 2>/dev/null
rm $HOME/.config/user-dirs.dirs 2>/dev/null
rm $HOME/.config/user-dirs.locale 2>/dev/null

bash $HOME/.dotfiles/stow.sh
