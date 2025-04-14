echo "[Git] Start"

# Add github.com to known hosts
if ! grep -q "github.com" "$HOME/.ssh/known_hosts"; then
  ssh-keyscan github.com >$HOME/.ssh/known_hosts
fi

git config --global user.name "Steven Wolf"
git config --global user.email "steven.wolf@pm.me"

git config --global init.defaultBranch "main"

git config --global pull.rebase "true"

git config --global push.autoSetupRemote "true"

git config --global rerere.enabled "true"

echo "[Git] Finished"
