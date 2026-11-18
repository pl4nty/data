-- Threat: !InfrastructureShared
-- Name: 41b3b8e6ca1a
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].timestamp
else
  return mp.CLEAN
end
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].timestamp
else
  return mp.CLEAN
end
if l_0_0 > l_0_1 or 50000000 < l_0_1 - l_0_0 then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2.integrity_level > MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
local l_0_3 = this_sigattrlog[3].ppid
local l_0_4 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_3)
if l_0_4.IntegrityLevel == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN
