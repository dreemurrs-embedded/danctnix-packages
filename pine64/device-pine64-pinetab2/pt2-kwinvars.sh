#!/bin/sh

# There's a bug in Plasma 6.8 which caused the renderer to use
# llvmpipe/softpipe instead of panfrost.
if [ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$USER" = "plasmalogin" ] ; then
	export MESA_LOADER_DRIVER_OVERRIDE=panfrost
fi
