echo "[SSH] Start"

SSH_DIR="$HOME/.ssh"
PRIVATE_KEY="$SSH_DIR/id_ed25519"
PUBLIC_KEY="$SSH_DIR/id_ed25519.pub"
ENCRYPTED_PRIVATE_KEY="keys/encrypted.gpg"
ENCRYPTED_PUBLIC_KEY="keys/pencrypted.gpg"

if [ ! -f "$PRIVATE_KEY" ] || [ ! -f "$PUBLIC_KEY" ]; then
  mkdir -p $SSH_DIR

  read -s -p "[SSH] Enter passphrase: " pw
  echo

  echo "$pw" | gpg --decrypt -o "$PRIVATE_KEY" "$ENCRYPTED_PRIVATE_KEY"
  if [ $? -ne 0 ]; then
    echo -e "\e[31m[SSH]\e[0m Failed to decrypt private key"
    exit 1
  fi

  echo "$pw" | gpg --decrypt -o "$PUBLIC_KEY" "$ENCRYPTED_PUBLIC_KEY"
  if [ $? -ne 0 ]; then
    echo -e "\e[31m[SSH]\e[0m Failed to decrypt public key"
    exit 1
  fi

  chmod 600 "$PRIVATE_KEY"
  chmod 644 "$PUBLIC_KEY"

  echo "AddKeysToAgent yes" >$HOME/.ssh/config
  chmod 644 "$SSH_DIR/config"
fi

echo -e "[SSH] Done"
