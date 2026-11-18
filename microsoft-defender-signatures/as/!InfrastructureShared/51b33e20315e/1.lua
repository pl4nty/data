-- Threat: !InfrastructureShared
-- Name: 51b33e20315e
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].timestamp
end
if this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].timestamp
end
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_2 = this_sigattrlog[1].utf8p1
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = sysio.GetFileLastWriteTime(l_0_2)
if sysio.GetLastResult().Success and l_0_3 ~= 0 then
  l_0_3 = l_0_3 / 10000000 - 11644473600
  local l_0_4 = MpCommon.GetCurrentTimeT()
  if l_0_3 > l_0_4 or 180 < l_0_4 - l_0_3 then
    return mp.CLEAN
  end
end
if l_0_0 < l_0_1 and l_0_1 - l_0_0 <= 50000000 then
  local l_0_5 = this_sigattrlog[3].ppid
  local l_0_6 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_5)
  if l_0_6.IntegrityLevel == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    return mp.INFECTED
  end
end
return mp.CLEAN
