echo -e "\e[32m[Software]\e[0m Installing non-free media codecs..."

# Packman repo
sudo zypper addrepo -cfp 90 'https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/' packman

sudo zypper refresh
sudo zypper in -y --allow-vendor-change --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec vlc-codecs
