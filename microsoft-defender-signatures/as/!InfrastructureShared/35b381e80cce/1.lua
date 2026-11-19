-- Threat: !InfrastructureShared
-- Name: 35b381e80cce
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "teamviewer", 1, true) or string.find(string.lower(l_0_0), "\\steam", 1, true) or string.find(string.lower(l_0_0), "torrent.exe", 1, true) or string.find(string.lower(l_0_0), "vncviewer.exe", 1, true) or string.find(string.lower(l_0_0), "modernwarfare.exe", 1, true) or string.find(string.lower(l_0_0), "workspaces.exe", 1, true) or string.find(string.lower(l_0_0), "deepl.exe", 1, true) or string.find(string.lower(l_0_0), "risingstorm2.exe", 1, true) or string.find(string.lower(l_0_0), "proctortrack.exe", 1, true) or string.find(string.lower(l_0_0), "monosnap.exe", 1, true) or string.find(string.lower(l_0_0), "explorer.exe", 1, true) or string.find(string.lower(l_0_0), "dsicord", 1, true) or string.find(string.lower(l_0_0), "chrome", 1, true) or string.find(string.lower(l_0_0), "m5_vario_", 1, true) or string.find(string.lower(l_0_0), "blackopscoldwar", 1, true) or string.find(string.lower(l_0_0), "game", 1, true) or string.find(string.lower(l_0_0), "gestionsiniestros.client.exe", 1, true) or string.find(string.lower(l_0_0), "\\uster.", 1, true) or string.find(string.lower(l_0_0), "cmrcviewer.exe", 1, true) or string.find(string.lower(l_0_0), "aqualiagisdesktop.exe", 1, true) or string.find(string.lower(l_0_0), "sage vendor\\_vendor", 1, true) or string.find(string.lower(l_0_0), "kxgui.exe", 1, true) or string.find(string.lower(l_0_0), "os_aktendruck.exe", 1, true) or string.find(string.lower(l_0_0), "qemgr.exe", 1, true) or string.find(string.lower(l_0_0), "boombeach.exe", 1, true) or string.find(string.lower(l_0_0), "cod_steam.exe", 1, true) or string.find(string.lower(l_0_0), "cod_bnet.exe", 1, true) or string.find(string.lower(l_0_0), "mstsc.exe", 1, true) or string.find(string.lower(l_0_0), "sunsystems.v4.exe", 1, true) then
    return mp.CLEAN
  end
  if IsDetectionThresholdMet("BM") then
    return mp.INFECTED
  end
end
return mp.CLEAN
