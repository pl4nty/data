-- Threat: !InfrastructureShared
-- Name: 2db3937d9ddb
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\windows\\explorer.exe", 1, true) or string.find(l_0_0, "\\system32\\svchost.exe", 1, true) or string.find(l_0_0, "\\syswow64\\svchost.exe", 1, true) or string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\adobe\\acrobat", 1, true) or string.find(l_0_0, "chrome.exe", 1, true) or string.find(l_0_0, "teams.exe", 1, true) or string.find(l_0_0, "msedge.exe", 1, true) or string.find(l_0_0, "iexplore.exe", 1, true) or string.find(l_0_0, "openwith.exe", 1, true) or string.find(l_0_0, "\\modernwarfare.exe", 1, true) or string.find(l_0_0, "\\league of legends.exe", 1, true) or string.find(l_0_0, "\\wowclassic.exe", 1, true) or string.find(l_0_0, "\\battle.net\\battle.net.exe", 1, true) or string.find(l_0_0, "\\grand theft auto v\\gta5.exe", 1, true) or string.find(l_0_0, "\\acrord32.exe", 1, true) or string.find(l_0_0, "\\firefox.exe", 1, true) or string.find(l_0_0, "\\azinfoprotection.exe", 1, true) or string.find(l_0_0, "git.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = false
local l_0_2, l_0_3, l_0_4
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_4 = string.lower(this_sigattrlog[1].utf8p1)
  _, l_0_2 = string.match(l_0_4, "(.-)([^\\]-)$")
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_5 = string.lower(this_sigattrlog[2].utf8p1)
  _, l_0_3 = string.match(l_0_5, "(.-)([^\\]-)$")
end
if l_0_2 ~= nil and l_0_3 ~= nil and l_0_2 == l_0_3 then
  l_0_1 = true
end
if l_0_1 == true then
  local l_0_6, l_0_7 = bm.get_process_relationships()
  for l_0_8, l_0_9 in ipairs(l_0_7) do
    local l_0_10 = mp.bitand(l_0_9.reason_ex, bm.RELATIONSHIP_CREATED)
    if l_0_10 == bm.RELATIONSHIP_CREATED and l_0_4 == string.lower(MpCommon.PathToWin32Path(l_0_9.image_path)) then
      TrackPidAndTechniqueBM(l_0_9.ppid, "T1055.002", "processinjection_target_r")
      bm.request_SMS(l_0_9.ppid, "M")
      bm.add_action("SmsAsyncScanEvent", 1000)
    end
    l_0_10 = mp.bitand(l_0_9.reason_ex, bm.RELATIONSHIP_INJECTION)
    if l_0_10 == bm.RELATIONSHIP_INJECTION then
      TrackPidAndTechniqueBM(l_0_9.ppid, "T1055.002", "processinjection_target_r")
      bm.request_SMS(l_0_9.ppid, "M")
      bm.add_action("SmsAsyncScanEvent", 1000)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
