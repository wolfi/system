echo -e "\e[32m[Software]\e[0m Installing apps..."

# 1Password repo
sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
sudo zypper addrepo https://downloads.1password.com/linux/rpm/stable/x86_64 1password

APPS=(
  1password
  blender
  gimp
  inkscape
  krita
  MozillaFirefox
  calibre
  zathura
  zathura-plugin-pdf-poppler
)

install_zypper "${APPS[@]}"

FLATPAK_APPS=(
  com.github.IsmaelMartinez.teams_for_linux
  com.github.iwalton3.jellyfin-media-player
  com.github.tchx84.Flatseal
  com.spotify.Client
  com.unity.UnityHub
  com.vivaldi.Vivaldi
  io.missioncenter.MissionCenter
  org.cataclysmdda.CataclysmDDA
  org.develz.Crawl
  org.signal.Signal
)

install_flatpak "${FLATPAK_APPS[@]}"

# sesh
go install github.com/joshmedeski/sesh/v2@latest

# TODO: icaclient
# ICAClient setup
# mkdir -p $HOME/.ICAClient/cache
# cp /opt/Citrix/ICAClient/config/{All_Regions,Trusted_Region,Unknown_Region,canonicalization,regions}.ini $HOME/.ICAClient/

# Copy Flatpak settings
cp ~/.dotfiles/flatpak/.local/share/flatpak/overrides/* ~/.local/share/flatpak/overrides/
