sudo pacman -S  projectm-pulseaudio

#确认在用的source
pacmd list-sources
pacmd stat 


"""
Controls (these are listed in the menu under hotkeys:

m - brings up a menu
f - toggles fullscreen on/off
l - locks to a particular preset
y - toggles shuffle mode
n - next preset
p - previous preset
r - selects random preset
F1 - Help menu
F2 - Toggles song title on/off (doesn't work in libvisual or pulseaudio as far as I can tell)
F3 - Toggle preset name on/off
F4 - Toggel rendering info on/off
F5 - Shows fps
"""


"""
'''
Troubleshooting
The first PulseAudio sound output device is used from the list shown by the command
If this is not the device you want to use, the easiest thing to do is to press 'm' to bring up the menu, then Settings > Pulse Audio Settings. Uncheck the checkbox at the bottom which says Try first available playback monitor, then select the correct device. Most likely it is one which ends in .monitor (if you want the visualizer to visualize what's being output/played).
'''
"""

