-- Threat: !InfrastructureShared
-- Name: 69b3480d4055
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 and l_0_1.integrity_level < MpCommon.SECURITY_MANDATORY_HIGH_RID then
  if string.find(l_0_0, "\\opencover.profiler.dll", 1, true) or string.find(l_0_0, "mscoree.dll", 1, true) then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_0) and not mp.IsKnownFriendlyFile(l_0_0, false, false) then
    bm.add_related_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
