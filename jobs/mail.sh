# https://bence.ferdinandy.com/2023/07/20/email-in-the-terminal-a-complete-guide-to-the-unix-way-of-email/
# https://linuxhint.com/gpg-command-ubuntu/

echo -e "\e[32m[Mail]\e[0m Installing mail utilities..."

PACMAN_MAIL=(
  gnupg
  aerc
)
install_pacman "${PACMAN_MAIL[@]}"

AUR_MAIL=(
  mailctl-bin
)

install_aur "${AUR_MAIL[@]}"
