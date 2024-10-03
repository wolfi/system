# Session
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

# Wayland stuff
export MOZ_ENABLE_WAYLAND=1
export OZONE_PLATFORM=wayland
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM=wayland
export QT_ENABLE_HIGHDPI_SCALING=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_WAYLAND_RECONNECT=1
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export KWIN_DRM_NO_AMS=1
export WLR_RENDERER=gles2

# Nvidia stuff
export LIBVA_DRIVER_NAME=nvidia
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia

# Prevent using hardware cursors in Wayland, forcing software-rendered cursors.
# Uncomment if you experience issues with your cursor
export WLR_NO_HARDWARE_CURSORS 1

# Allow the Wayland renderer to fall back to software rendering if necessary.
# Uncomment if you are running in a virtual machine or have an underpowered GPU
# export WLR_RENDERER_ALLOW_SOFTWARE=1
