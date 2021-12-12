#!/bin/bash

MIC="alsa_input.usb-C-Media_Electronics_Inc._USB_PnP_Sound_Device-00.mono-fallback"
MIC_VR="alsa_input.usb-Valve_Corporation_Valve_VR_Radio___HMD_Mic_8A0D43F386-LYM-01.multichannel-input"

OUT="alsa_output.usb-C-Media_Electronics_Inc._USB_PnP_Sound_Device-00.analog-stereo"
OUT_VR="alsa_output.pci-0000_0a_00.1.hdmi-stereo"

pacmd set-source-mute $MIC 0
pacmd set-source-mute $MIC_VR 0

# "combined" voice
pacmd load-module module-null-sink sink_name="vsink_voice"
pacmd load-module module-loopback source=$MIC sink="vsink_voice"
pacmd load-module module-loopback source=$MIC_VR sink="vsink_voice"
# virtual mic for discord
pacmd load-module module-remap-source source_name="vmic_voice" master=vsink_voice.monitor source_properties=device.description="Voice_mic"

#create virtual mic containing desktop sound
pacmd load-module module-null-sink sink_name="vsink_desktop" sink_properties=device.description="Desktop_out"
#use this as default output

pacmd load-module module-combine-sink sink_name="vsink_stream" slaves="vsink_desktop","vsink_voice"

pacmd load-module module-remap-source source_name="vmic_stream" master=vsink_stream.monitor source_properties=device.description="Stream_mic"
#use this input on discord when streaming

#this channel combines discord audio with desktop and sends to real output
pacmd load-module module-null-sink sink_name="vsink_discord" sink_properties=device.description="Discord_out"
pacmd load-module module-null-sink sink_name="vsink_all" sink_properties=device.description="Master_out"
pacmd load-module module-loopback source=vsink_desktop.monitor sink=vsink_all
pacmd load-module module-loopback source=vsink_discord.monitor sink=vsink_all

# send desktop audio to headsets
pacmd load-module module-loopback source=vsink_all.monitor sink=$OUT
pacmd load-module module-loopback source=vsink_all.monitor sink=$OUT_VR

