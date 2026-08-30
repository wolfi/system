BUILDDIR=/tmp/evi
INSTALLDIR=$HOME/.local/evi

if [[ ! $(evi --version | grep "EVi") ]]; then
  echo -e "\e[32m[EVi]\e[0m Building EVi..."

  if [ ! -d "$BUILDDIR" ]; then
    cd /tmp
    git clone https://codeberg.org/evi-editor/evi
  else
    echo -e "\e[32m[EVi]\e[0m Already downloaded, skipping"
  fi

  cd $BUILDDIR

  sudo sed -i 's/#CONF_OPT_GUI = --disable-gui/CONF_OPT_GUI = --disable-gui/' $BUILDDIR/src/Makefile
  sudo sed -i 's/#CONF_OPT_MULTIBYTE = --disable-rightleft --disable-arabic/CONF_OPT_MULTIBYTE = --disable-rightleft --disable-arabic/' $BUILDDIR/src/Makefile
  sudo sed -i 's/# CONF_OPT_CANBERRA = --disable-canberra/CONF_OPT_CANBERRA = --disable-canberra/' $BUILDDIR/src/Makefile
  sudo sed -i 's/#CONF_OPT_FEAT = --with-features=huge/CONF_OPT_FEAT = --with-features=huge/' $BUILDDIR/src/Makefile

  make clean
  make -j$(nproc --ignore=2)
  sudo make install
else
  echo -e "\e[32m[EVi]\e[0m Already installed, skipping"
fi

# if [[ ! $(emacs --version | grep "$VERSION") ]]; then
#   echo -e "\e[32m[Emacs]\e[0m Building Emacs $VERSION..."
#
#   if [ ! -d "$BUILDDIR/emacs-$VERSION" ]; then
#     mkdir -p $BUILDDIR
#     cd $BUILDDIR
#     wget https://ftp.gnu.org/gnu/emacs/emacs-$VERSION.tar.xz
#     tar -xf emacs-$VERSION.tar.xz
#   else
#     echo -e "\e[32m[Emacs]\e[0m Already downloaded, skipping"
#   fi
#
#   cd $BUILDDIR/emacs-$VERSION
#   ./configure --prefix=$INSTALLDIR
#
#   make -j$(nproc --ignore=2)
#   make install
#
#   ln -s $INSTALLDIR/bin/emacs ~/.local/bin/emacs
#
#   echo -e "\e[32m[Emacs]\e[0m Done"
# else
#   echo -e "\e[32m[Emacs]\e[0m Already installed, skipping"
# fi
