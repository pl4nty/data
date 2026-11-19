-- Threat: !InfrastructureShared
-- Name: 55b3e6154b7a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if string.find(l_0_0, "\\avast", 1, true) or string.find(l_0_0, "\\webnavigatorbrowser", 1, true) or string.find(l_0_0, "\\ccleaner", 1, true) or string.find(l_0_0, "\\chrome.exe", 1, true) or string.find(l_0_0, "\\webexplorer", 1, true) or string.find(l_0_0, "\\teams\\", 1, true) or string.find(l_0_0, "\\fmr.", 1, true) then
  return mp.CLEAN
end
local l_0_1 = string.lower(this_sigattrlog[2].utf8p1)
local l_0_2, l_0_3 = bm.get_process_relationships()
for l_0_4, l_0_5 in ipairs(l_0_3) do
  local l_0_6 = mp.bitand(l_0_5.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_6 == bm.RELATIONSHIP_CREATED and string.find(l_0_5.image_path, l_0_1, 1, true) then
    TrackPidAndTechniqueBM(l_0_5.ppid, "T1055.002", "processinjection_target_u")
    bm.request_SMS(l_0_5.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1000)
  end
end
return mp.INFECTED
