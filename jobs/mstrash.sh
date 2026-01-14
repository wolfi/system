# Install apps required at work
echo -e "\e[32m[Unity]\e[0m Installing MS trash apps for work..."

FLATPAK_UNITY_APPS=(
  com.github.IsmaelMartinez.teams_for_linux

)
install_flatpak "${FLATPAK_UNITY_APPS[@]}"
