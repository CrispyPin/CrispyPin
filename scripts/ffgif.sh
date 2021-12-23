#!/bin/bash
echo making gif from $1
echo
ffmpeg -i $1 -filter_complex "[0:v] palettegen" $1.palette.png
ffmpeg -i $1 -i $1.palette.png -filter_complex "[0:v][1:v] paletteuse" $1.gif
rm $1.palette.png
