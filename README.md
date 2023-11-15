# mpv_auto-deinterlace
Automatic deinterlace scripts for mpv player.
-> '*.lua' scripts that will automatically set deinterlace property in mpv player to yes/no based on whether content is progressive or interlaced.

IMPORTANT: These scripts are not meant to be working together!
Please choose **only one** you decide to use and put it in your '(...main mpv folder...)\mpv\scripts\' directory.
Their behavior is only slightly different and is described inside *.lua files as comments at the very beginning.

Tested on WIN10 on shinchiro builds _mpv-x86_64-20231112-git-7cab30c_ and _mpv-x86_64-v3-20231112-git-7cab30c_ releases.

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
This can be reverted with keybind "ctrl+d" and will be automatically reverted at the end-file event.

PLEASE NOTE: if it is reverted it will set hwdec to "auto-safe" - when you'd like different behaviour
you need to change lines in the lua script, which contain: 'mp.set_property("hwdec", "auto-safe")' to:
'mp.set_property("hwdec", "*your desired value")'.
That's important, because you should set it to your default option you use for hwdec as standard in mpv.conf, as this will be loaded on end-file.

![image](https://github.com/szym0ne/mpv_auto-deinterlace/assets/150375668/bd69246c-71d8-41ea-9699-e19da513bf9d)

# auto-deinterlace_let-a-only.lua
This script checks whether current video is interlaced when:
1. new file is loaded
2. on seek
3. when you manually toggle deinterlace on/off with assigned keybind
and automatically sets deinterlace on/off.

This won't let you set 'deinterlace:yes' for progressive video and
set 'deinterlace:no' for interlaced video as it
checks if the value you set is correct every time you manually change it with assigned keybind.

# auto-deinterlace_let-m.lua
This script checks whether current video is interlaced when:
1. new file is loaded
2. on seek
and automatically sets deinterlace on/off.

This will let you set 'deinterlace:yes' for progressive video and
set 'deinterlace:no' for interlaced video until 'new file is loaded(1) or seek(2) is done
if one of two: (1) or (2) will occur it will automatically apply 'deinterlace yes/no'
based on whether the content is interlaced.
