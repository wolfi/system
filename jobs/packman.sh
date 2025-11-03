# Install all commmon codecs
echo -e "\e[32m[Packman]\e[0m Adding Packman repository..."

sudo zypper addrepo -y -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman
sudo zypper refresh
