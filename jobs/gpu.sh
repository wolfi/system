# Install everyhting needed for AMD GPU and Vulkan
# https://en.opensuse.org/Vulkan
echo -e "\e[32m[Gaming]\e[0m Installing gpu and vulkan deps..."

GAMING_APPS=(
  kernel-firmware-amdgpu
  libdrm_amdgpu1
  libdrm_amdgpu1-32bit
  libdrm_radeon1
  libdrm_radeon1-32bit
  libvulkan_radeon
  libvulkan_radeon-32bit
  libvulkan1
  libvulkan1-32bit
)
install_zypper "${GAMING_APPS[@]}"
