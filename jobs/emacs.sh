VERSION=31.1

BUILDDIR=/tmp/emacs-$VERSION
INSTALLDIR=$HOME/.local/emacs

BUILD_DEPS=(
  giflib-devel
  gtk3-devel
  libXaw3d-devel
  libXpm-devel
  libgccjit-devel
  libgnutls-devel
  tree-sitter-devel
  librsvg-2-2
  librsvg-devel

  # Not build deps, but tools related to emacs
  aspell
  aspell-en
  aspell-de
  sdcv # Offline dictionary
)

install_zypper "${BUILD_DEPS[@]}"

echo -e "\e[32m[Emacs]\e[0m Installing dictionaries for sdcv..."
TARGET_DIR="/usr/share/stardict/dic/"
BASE_URL="http://download.huzheng.org"
DICTIONARIES=(
    freedict.de/stardict-freedict-deu-eng-2.4.2.tar.bz2
    freedict.de/stardict-freedict-eng-deu-2.4.2.tar.bz2
    de/stardict-ldaf-2.4.2.tar.bz2
    de/stardict-duden-2.4.2.tar.bz2
    bigdict/stardict-Merriam-Webster_s_Advanced_Learner_s_Dictionary-2.4.2.tar.bz2
    bigdict/stardict-Merriam-Webster_s_Collegiate_11th_Ed-2.4.2.tar.bz2
    bigdict/stardict-Merriam-Webster_s_Collegiate_Thesaurus-2.4.2.tar.bz2
    bigdict/stardict-Roget_s_II_The_New_Thesaurus_3th_Ed-2.4.2.tar.bz2
    bigdict/stardict-Urban_Dictionary_P1-2.4.2.tar.bz2
    bigdict/stardict-Urban_Dictionary_P2-2.4.2.tar.bz2
)

sudo mkdir -p "$TARGET_DIR"

# Download and extract each archive
for dict in "${DICTIONARIES[@]}"; do
    ARCHIVE_URL="$BASE_URL/$dict"
    ARCHIVE_NAME=$(basename "$dict")
    EXTRACTED_DIR="$TARGET_DIR$(basename "$dict" .tar.bz2)"

    # Skip if the extracted directory already exists
    if [ -d "$EXTRACTED_DIR" ]; then
        echo "Skipping $ARCHIVE_NAME: Already extracted in $EXTRACTED_DIR"
        continue
    fi

    echo "Downloading $ARCHIVE_URL..."
    wget -q "$ARCHIVE_URL" -O "/tmp/$ARCHIVE_NAME"

    if [ $? -eq 0 ]; then
        echo "Extracting $ARCHIVE_NAME to $TARGET_DIR..."
        sudo tar -xjf "/tmp/$ARCHIVE_NAME" -C "$TARGET_DIR"
        rm "/tmp/$ARCHIVE_NAME"
    else
        echo "Failed to download $ARCHIVE_URL"
    fi
done

# if [[ ! $(emacs --version | grep "$VERSION") ]]; then
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

export CFLAGS="-O2 -pipe -march=native -mtune=native -fno-omit-frame-pointer -fno-plt -flto=auto"
export LDFLAGS="-Wl,-O2 -Wl,-z,now -Wl,-z,relro -Wl,--sort-common -Wl,--as-needed -Wl,-z,pack-relative-relocs -flto=auto -O2"

./configure \
  --prefix=$INSTALLDIR \
  --without-x \
  --with-pgtk \
  --with-toolkit-scroll-bars \
  --with-cairo \
  --without-xft \
  --with-harfbuzz \
  --without-libotf \
  --with-gnutls \
  --without-xdbe \
  --without-xim \
  --without-gpm \
  --disable-gc-mark-trace \
  --with-gsettings \
  --with-modules \
  --with-threads \
  --with-libgmp \
  --with-rsvg \
  --with-xml2 \
  --with-tree-sitter \
  --with-zlib \
  --without-included-regex \
  --with-native-compilation \
  --with-file-notification=inotify \
  --without-compress-install

make -j "$(nproc)" -l "$(nproc --ignore=1)"
make install-strip

ln -s $INSTALLDIR/bin/emacs ~/.local/bin/emacs

echo -e "\e[32m[Emacs]\e[0m Done"
# else
#   echo -e "\e[32m[Emacs]\e[0m Already installed, skipping"
# fi
