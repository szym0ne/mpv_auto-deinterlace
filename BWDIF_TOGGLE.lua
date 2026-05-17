local original_hwdec = nil
local bwdif_active = false

function bwdif_off_without_msg()
    if bwdif_active then
        mp.commandv("vf", "remove", "lavfi=bwdif")
        mp.set_property("hwdec", original_hwdec or "vaapi")
        bwdif_active = false
    end
end

function deint_vf_bwdif()
    if mp.get_property("deinterlace") == "yes" then return end

    if not bwdif_active then
        original_hwdec = mp.get_property("hwdec")
        mp.set_property("hwdec", "no")
        mp.commandv("vf", "add", "lavfi=bwdif")
        bwdif_active = true
        mp.osd_message('BWDIF FILTER ON')
    else
        mp.commandv("vf", "remove", "lavfi=bwdif")
        mp.set_property("hwdec", original_hwdec or "vaapi")
        bwdif_active = false
        mp.osd_message('BWDIF FILTER OFF')
    end
end

mp.register_event("end-file", bwdif_off_without_msg)
mp.add_key_binding("ctrl+d", deint_vf_bwdif)
mp.add_key_binding("ctrl+D", deint_vf_bwdif)

--below added for mpv-menu-plugin
mp.add_key_binding('', 'BWDIF_TOGGLE', deint_vf_bwdif)
