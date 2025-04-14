echo "[Yay] Start"

if [ ! -d "/tmp/yay" ]; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  rm -rf /tmp/yay
else
  echo -e "\e[32m[Yay]\e[0m Already set up, skipping"
fi
