# Install basic utilities
echo -e "\e[32m[Containerization]\e[0m Installing..."

# Load virtio at boot
if [ ! -f "/etc/modules-load.d/virtio-net.conf" ]; then
  sudo echo "virtio_net" >/etc/modules-load.d/virtio-net.conf
fi

VIRTUALIZATION_UTILS=(
  libvirt
  qemu
  virsh
  virt-manager
)
install_zypper "${VIRTUALIZATION_UTILS[@]}"

sudo systemctl enable --now libvirtd.service
