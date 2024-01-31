function old_x264()
	if string.match(mp.get_property("video-params/pixelformat"), "yuv444p10")
	or string.match(mp.get_property("video-params/hw-pixelformat"), "yuv444p10")
		then mp.set_property("vd-lavc-assume-old-x264", "yes")
		else 
			mp.set_property("vd-lavc-assume-old-x264", "no")
	end
end

function old_x264_ON_with_msg()
	mp.set_property("vd-lavc-assume-old-x264", "yes")
	mp.osd_message('Assume buggy x264 version ON')
end

function old_x264_OFF_with_msg()
	mp.set_property("vd-lavc-assume-old-x264", "no")
	mp.osd_message('Assume buggy x264 version OFF')
end



mp.register_event("playback-restart", old_x264)
mp.add_key_binding("Alt+x", old_x264_ON_with_msg)
mp.add_key_binding("Alt+c", old_x264_OFF_with_msg)