# Install basic utilities
echo -e "\e[32m[Containerization]\e[0m Installing..."

# Load virtio at boot
if [ ! -f "/etc/modules-load.d/virtio-net.conf" ]; then
  sudo echo "virtio_net" >/etc/modules-load.d/virtio-net.conf
fi

VIRTUALIZATION_UTILS=(
  libvirt
  qemu
  virt-manager
)
install_zypper "${VIRTUALIZATION_UTILS[@]}"

# use iptables to enable internet access in vms
sudo sed -i 's/#firewall_backend = "nftables"/firewall_backend = "iptables"/' /etc/libvirt/network.conf

sudo systemctl enable --now libvirtd.service

# Add user to libvirt group
sudo usermod -a -G libvirt $USER
