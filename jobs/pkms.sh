echo -e "\e[32m[PKMS]\e[0m Installing Logseq..."

AUR_LOGSEQ=(
  logseq-desktop-bin
)

install_aur "${AUR_LOGSEQ[@]}"

if [ ! -d "$HOME/personal/pkms-logseq" ]; then
  echo -e "\e[32m[PKMS]\e[0m Cloning PKMS repo..."
  git clone git@github.com:Wolfi/pkms-logseq.git $HOME/personal/pkms-logseq
fi
