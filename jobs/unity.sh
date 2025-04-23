# Install unity game engine
echo -e "\e[32m[Unity]\e[0m Installing unity engine..."

FLATPAK_UNITY_APPS=(
  com.unity.UnityHuh
  org.freedesktop.Sdk.Extension.mono6
  org.freedesktop.Sdk.Extension.dotnet6
  com.vscodium.codium
)
install_flatpak "${FLATPAK_UNITY_APPS[@]}"
