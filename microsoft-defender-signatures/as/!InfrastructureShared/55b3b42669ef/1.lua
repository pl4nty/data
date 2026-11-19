-- Threat: !InfrastructureShared
-- Name: 55b3b42669ef
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
local l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].timestamp
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].timestamp
end
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].timestamp
end
if this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].timestamp
end
if l_0_1 > l_0_2 or l_0_0.ppid == nil or string.find(l_0_0.ppid, "pid:4$", 1, false) ~= nil or string.find(l_0_0.ppid, "pid:4,", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[4].ppid)
if l_0_0.token_elevation_type ~= MpCommon.TOKEN_ELEVATION_TYPE_FULL and l_0_0.integrity_level < l_0_3.IntegrityLevel and l_0_3.IntegrityLevel == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN
