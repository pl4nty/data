-- Threat: !InfrastructureShared
-- Name: 72b341e3de9d
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level < MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[1].utf8p2))
end
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, " -s ", 1, true) then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_2 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[2].utf8p1))
end
if l_0_2 == nil then
  return mp.CLEAN
end
if string.find(l_0_2, "windhawk", 1, true) or string.find(l_0_2, "explorerblurmica", 1, true) or string.find(l_0_2, "hookbase", 1, true) or string.find(l_0_2, "oldnewexplorer", 1, true) or string.find(l_0_2, "filemonitor", 1, true) then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_2) and not mp.IsKnownFriendlyFile(l_0_2, true, false) then
  bm.add_related_file(l_0_2)
end
bm.add_related_string("DLL", tostring(l_0_2), bm.RelatedStringBMReport)
return mp.INFECTED
