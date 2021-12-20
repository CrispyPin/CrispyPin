#!/bin/bash

v4l2-ctl -c exposure_auto=1

v4l2-ctl -c exposure_absolute=39

v4l2-ctl -c brightness=255

v4l2-ctl -c contrast=10

#does this make a difference?
v4l2-ctl -c sharpness=50



