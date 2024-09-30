# Set desktop and session type
export XDG_SESSION_TYPE wayland
export XDG_CURRENT_DESKTOP sway
export XDG_SESSION_DESKTOP sway

# Specify Wayland backends for various applications
export MOZ_ENABLE_WAYLAND 1
export OZONE_PLATFORM wayland
export GDK_BACKEND wayland
export QT_QPA_PLATFORM wayland

# Prevent using hardware cursors in Wayland, forcing software-rendered cursors.
# Uncomment if you experience issues with your cursor
# export WLR_NO_HARDWARE_CURSORS 1

# Allow the Wayland renderer to fall back to software rendering if necessary.
# Uncomment if you are running in a virtual machine or have an underpowered GPU
export WLR_RENDERER_ALLOW_SOFTWARE 1

sway --unsupported-gpu
