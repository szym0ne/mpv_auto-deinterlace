# mpv_auto-deinterlace
Automatic deinterlace scripts for mpv player.
-> '*.lua' scripts that will automatically set deinterlace property in mpv player to yes/no based on whether content is progressive or interlaced.

IMPORTANT: These scripts are not meant to be working together!
Please choose **only one** you decide to use and put it in your '(...main mpv folder...)\mpv\scripts\' directory.
Their behavior is only slightly different and is described inside *.lua files as comments at the very beginning.

Tested on WIN10 on shinchiro builds mpv-x86_64-20231112-git-7cab30c and mpv-x86_64-v3-20231112-git-7cab30c releases.

# auto-deinterlace_II.lua
This script checks whether current video is interlaced when:
1. new file is loaded
2. on seek
3. when you manually toggle deinterlace on/off with assigned keybind
and automatically sets deinterlace on/off.

This won't let you set 'deinterlace:yes' for progressive video and
set 'deinterlace:no' for interlaced video with assigned keybind as it
checks if the value you set is correct every time you manually change it with assigned keybind.

However this will let you switch on video filter bwdif with keybind "ctrl+shift+d"
if the video isn't recognized as interlaced - at the same time it will switch off hwdec
as it seems not to be working correctly with bwdif on.
Above can be reverted with keybind "ctrl+d" and will be automatically reverted at the end-file event.
PLEASE NOTE: if it is reverted it will set hwdec to "auto-safe" - when you'd like different behaviour
you need to change lines below, which contain: 'mp.set_property("hwdec", "auto-safe")' to:
'mp.set_property("hwdec", "*your desired value")'.

# auto-deinterlace_let-a-only.lua
This script checks whether current video is interlaced when:
1. new file is loaded
2. on seek
3. when you manually toggle deinterlace on/off with assigned keybind
and automatically sets deinterlace on/off.

This won't let you set 'deinterlace:yes' for progressive video and
set 'deinterlace:no' for interlaced video as it
checks if the value you set is correct every time you manually change it with assigned keybind.
