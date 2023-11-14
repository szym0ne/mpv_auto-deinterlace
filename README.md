# mpv_auto-deinterlace
Automatic deinterlace scripts for mpv player.
-> '*.lua' scripts that will automatically set deinterlace property in mpv player to yes/no based on whether content is progressive or interlaced.

IMPORTANT: These scripts are not meant to be working together!
Please choose **only one** you decide to use and put it in your '(...main mpv folder...)\mpv\scripts\' directory.
Their behavior is only slightly different and is described inside *.lua files as comments at the very beginning.

Tested on WIN10 on shinchiro builds mpv-x86_64-20231112-git-7cab30c and mpv-x86_64-v3-20231112-git-7cab30c releases.

# auto-deinterlace_let-a-only.lua
This script checks whether current video is interlaced when:
1. new file is loaded
2. on seek
3. when you manually toggle deinterlace on/off with assigned keybind
and automatically sets deinterlace on/off.

This won't let you set 'deinterlace:yes' for progressive video and
set 'deinterlace:no' for interlaced video as it
checks if the value you set is correct every time you manually change it with assigned keybind.
