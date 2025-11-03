# Install all commmon codecs
echo -e "\e[32m[Codecs]\e[0m Installing codecs..."

sudo zypper install -y --allow-vendor-change --from packman ffmpeg gstreamer-plugins-{good,bad,ugly,libav} libavcodec vlc-codecs
