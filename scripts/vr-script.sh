#!/bin/bash


MIC = "alsa_input.usb-C-Media_Electronics_Inc._USB_PnP_Sound_Device-00.mono-fallback"
MIC_VR = "alsa_input.usb-Valve_Corporation_Valve_VR_Radio___HMD_Mic_8A0D43F386-LYM-01.multichannel-input"

set-source-mute $MIC 1
set-source-mute $MIC_VR 0
steam steam://rungameid/250820
#set-source-mute $MIC 0
#set-source-mute $MIC_VR 1

