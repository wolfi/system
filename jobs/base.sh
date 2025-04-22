# Install basic utilities
echo -e "\e[32m[Basics]\e[0m Installing base utilities..."

SYSTEM_UTILS=(
  cmake
  pyenv
  pyenv-zsh-completion
)

install_zypper "${SYSTEM_UTILS[@]}"

# Basic dev tools and libs
sudo zypper in -y -t pattern devel_basis devel_C_C++ devel_kernel

# Install python
PY_VERSION=3.12
pyenv install -s $PY_VERSION
pyenv global $PY_VERSION

