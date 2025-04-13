echo "[Yay] Start"

git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si

echo "[Yay] Finished"
