#!/bin/sh

# There's a bug in Plasma 6.8 which caused the renderer to use
# llvmpipe/softpipe instead of panfrost.
if [ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$USER" = "plasmalogin" ] ; then
	export MESA_LOADER_DRIVER_OVERRIDE=panfrost
fi

# Use V4L2 request VAAPI driver if it's installed
if [ -f /usr/lib/dri/v4l2_request_drv_video.so ]; then
	export LIBVA_DRIVER_NAME=v4l2_request
fi

# Let's experiment with GL 3.3 here, I don't think I've seen anything breaks.
export PAN_MESA_DEBUG=gl3
