echo -e "\e[32m[Themes]\e[0m Installing GTK, icon and cursor themes..."

ZYPPER_THEMES=(
  papirus-icon-theme
)

install_zypper "${ZYPPER_THEMES[@]}"

FLATPAK_THEMES=(
  org.gtk.Gtk3theme.Zukitwo  
  org.gtk.Gtk3theme.Adapta
  org.gtk.Gtk3theme.Qogir
)

install_flatpak "${FLATPAK_THEMES[@]}"
