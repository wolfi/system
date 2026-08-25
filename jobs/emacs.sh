VERSION=31.1

BUILDDIR=/tmp/emacs-$VERSION
INSTALLDIR=$HOME/.local/emacs

BUILD_DEPS=(
  libXaw3d-devel
  libgccjit-devel
  giflib-devel
  libXpm-devel
  libgnutls-devel
)

install_zypper "${BUILD_DEPS[@]}"

if [[ ! $(emacs --version | grep "$VERSION") ]]; then
  echo -e "\e[32m[Emacs]\e[0m Building Emacs $VERSION..."

  if [ ! -d "$BUILDDIR/emacs-$VERSION" ]; then
    mkdir -p $BUILDDIR
    cd $BUILDDIR
    wget https://ftp.gnu.org/gnu/emacs/emacs-$VERSION.tar.xz
    tar -xf emacs-$VERSION.tar.xz
  else
    echo -e "\e[32m[Emacs]\e[0m Already downloaded, skipping"
  fi

  cd $BUILDDIR/emacs-$VERSION
  ./configure --prefix=$INSTALLDIR

  make -j$(nproc --ignore=2)
  make install

  ln -s $INSTALLDIR/bin/emacs ~/.local/bin/emacs

  echo -e "\e[32m[Emacs]\e[0m Done"
else
  echo -e "\e[32m[Emacs]\e[0m Already installed, skipping"
fi
