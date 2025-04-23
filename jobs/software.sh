echo -e "\e[32m[Software]\e[0m Installing apps..."

APPS=(
  blender
  gimp
  inkscape
  krita
  chromium
  MozillaFirefox
  calibre
  zathura
  zathura-plugin-pdf-poppler
)

install_zypper "${APPS[@]}"

FLATPAK_APPS=(
  org.signal.Signal
  com.github.IsmaelMartinez.teams_for_linux
  com.vivaldi.Vivaldi
  com.spotify.Client
)

install_flatpak "${FLATPAK_APPS[@]}"

# sesh
go install github.com/joshmedeski/sesh/v2@latest

# 1Password
flatpak install https://downloads.1password.com/linux/flatpak/1Password.flatpakref

# TODO: icaclient
# ICAClient setup
# mkdir -p $HOME/.ICAClient/cache
# cp /opt/Citrix/ICAClient/config/{All_Regions,Trusted_Region,Unknown_Region,canonicalization,regions}.ini $HOME/.ICAClient/
