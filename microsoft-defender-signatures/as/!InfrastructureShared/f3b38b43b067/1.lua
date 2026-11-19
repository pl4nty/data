-- Threat: !InfrastructureShared
-- Name: f3b38b43b067
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p1
local l_0_1 = sysio.GetFileLastWriteTime(l_0_0)
if not sysio.GetLastResult().Success or l_0_1 == 0 then
  return mp.CLEAN
end
l_0_1 = l_0_1 / 10000000 - 11644473600
local l_0_2 = MpCommon.GetCurrentTimeT()
if not l_0_2 or l_0_1 > l_0_2 or 86400 < l_0_2 - l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
