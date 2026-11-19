-- Threat: !InfrastructureShared
-- Name: 25b356f1081a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\windows\\explorer.exe", 1, true) or string.find(l_0_0, "\\system32\\svchost.exe", 1, true) or string.find(l_0_0, "\\syswow64\\svchost.exe", 1, true) or string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\adobe\\acrobat", 1, true) or string.find(l_0_0, "chrome.exe", 1, true) or string.find(l_0_0, "teams.exe", 1, true) or string.find(l_0_0, "msedge.exe", 1, true) or string.find(l_0_0, "iexplore.exe", 1, true) or string.find(l_0_0, "openwith.exe", 1, true) or string.find(l_0_0, "\\modernwarfare.exe", 1, true) or string.find(l_0_0, "\\league of legends.exe", 1, true) or string.find(l_0_0, "\\wowclassic.exe", 1, true) or string.find(l_0_0, "\\battle.net\\battle.net.exe", 1, true) or string.find(l_0_0, "\\grand theft auto v\\gta5.exe", 1, true) or string.find(l_0_0, "\\acrord32.exe", 1, true) or string.find(l_0_0, "\\firefox.exe", 1, true) or string.find(l_0_0, "\\azinfoprotection.exe", 1, true) or string.find(l_0_0, "git.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_2) do
  local l_0_5 = mp.bitand(l_0_4.reason_ex, bm.RELATIONSHIP_INJECTION)
  if l_0_5 == bm.RELATIONSHIP_INJECTION then
    TrackPidAndTechniqueBM(l_0_4.ppid, "T1055.002", "processinjection_target_m")
    bm.request_SMS(l_0_4.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1000)
  end
end
return mp.INFECTED
