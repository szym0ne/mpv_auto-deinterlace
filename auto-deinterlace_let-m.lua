-- This script checks whether current video is interlaced when:
-- 1. new file is loaded
-- 2. on seek
-- and automatically sets deinterlace on/off.
-- 
-- This will let you set 'deinterlace:yes' for progressive video and
-- set 'deinterlace:no' for interlaced video until 'new file is loaded(1) or seek(2) is done
-- if one of two: (1) or (2) will occur it will automatically apply 'deinterlace yes/no'
-- based on whether the content is interlaced.


function deint()

	if mp.get_property("video-frame-info/interlaced") == "yes"
	or mp.get_property("video-frame-info/tff") == "yes"
		then mp.set_property("deinterlace", "yes")
	else
		mp.set_property("deinterlace", "no")
	end
end


mp.register_event("playback-restart", deint)
