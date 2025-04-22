echo "[Git] Start"

KNOWN_HOSTS="$HOME/.ssh/known_hosts" 

# Add github.com to known hosts
if [ ! -f "$KNOWN_HOSTS" ]  ; then
  touch $KNOWN_HOSTS
fi

if ! grep -q "github.com" "$KNOWN_HOSTS"; then
  ssh-keyscan github.com > "$KNOWN_HOSTS"
fi

git config --global user.name "Steven Wolf"
git config --global user.email "steven.wolf@pm.me"

git config --global init.defaultBranch "main"

git config --global pull.rebase "true"

git config --global push.autoSetupRemote "true"

git config --global rerere.enabled "true"

echo "[Git] Finished"
