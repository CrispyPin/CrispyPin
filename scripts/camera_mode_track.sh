#!/bin/bash

v4l2-ctl -c auto_exposure=1

v4l2-ctl -c exposure_time_absolute=39

v4l2-ctl -c brightness=255

v4l2-ctl -c contrast=10

#does this make a difference?
#v4l2-ctl -c sharpness=50



