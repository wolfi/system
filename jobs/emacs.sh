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

  # Grammars
  # tree-sitter-bash
  # tree-sitter-c
  # tree-sitter-c-sharp
  # tree-sitter-commonlisp
  # tree-sitter-cpp
  # tree-sitter-css
  # tree-sitter-csv
  # tree-sitter-glsl
  # tree-sitter-go
  # tree-sitter-hare
  # tree-sitter-hlsl
  # tree-sitter-html
  # tree-sitter-javascript
  # tree-sitter-json
  # tree-sitter-lua
  # tree-sitter-markdown
  # tree-sitter-meson
  # tree-sitter-odin
  # tree-sitter-python
  # tree-sitter-rust
  # tree-sitter-scheme
  # tree-sitter-toml
  # tree-sitter-vim
  # tree-sitter-wgsl
  # tree-sitter-xml
  # tree-sitter-yaml
  # tree-sitter-zig
)

install_zypper "${BUILD_DEPS[@]}"

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
