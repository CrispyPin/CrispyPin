#!/bin/env python3
import os

angle = 0
while True:
	angle += 1
	#os.system(f"xrandr --output HDMI-A-0 --transform 1,0,0,0,1,0,0,0,1")
	#os.system(f"xrandr --output HDMI-A-0 --transform 0.97815,-0.20791,0,0.20791,0.97815,0,0,0,1")
	#os.system(f"xrandr --output HDMI-A-0 --transform 1,0.8,0,0.2,1.4,0,0,0,1")
	#os.system(f"xrandr --output HDMI-A-0 --transform 1,0,0,0,1,-1,1,1,0")
	os.system(f"xrandr --output HDMI-A-0 --transform -0.20791,0.97815,0,0.20791,0.97815,1,0,0,1")
	
	break
