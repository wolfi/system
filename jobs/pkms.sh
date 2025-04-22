echo -e "\e[32m[PKMS]\e[0m Installing Logseq..."

FLATPAK_LOGSEQ=(
  com.logseq.Logseq
)

install_flatpak "${FLATPAK_LOGSEQ[@]}"

if [ ! -d "$HOME/personal/pkms-logseq" ]; then
  echo -e "\e[32m[PKMS]\e[0m Cloning PKMS repo..."
  git clone git@github.com:Wolfi/pkms-logseq.git $HOME/personal/pkms-logseq
fi
