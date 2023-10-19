#!/bin/bash

# Hardware cursors not yet working on wlroots
export WLR_NO_HARDWARE_CURSORS=1
# Set wlroots renderer to Vulkan to avoid flickering
export WLR_RENDERER=vulkan
# OpenGL Variables
export GBM_BACKEND=nvidia-drm

export __GL_GSYNC_ALLOWED=0
export __GL_VRR_ALLOWED=0
export __GLX_VENDOR_LIBRARY_NAME=nvidia
# Xwayland compatibility
export XWAYLAND_NO_GLAMOR=1
