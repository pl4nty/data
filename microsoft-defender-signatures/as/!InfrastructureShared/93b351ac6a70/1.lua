-- Threat: !InfrastructureShared
-- Name: 93b351ac6a70
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
else
  return mp.CLEAN
end
if not l_0_0 then
  return mp.CLEAN
end
if not sysio.IsFileExists(l_0_0) or mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1 = sysio.GetFileLastWriteTime(l_0_0)
if not sysio.GetLastResult().Success or l_0_1 == 0 then
  return mp.CLEAN
end
l_0_1 = l_0_1 / 10000000 - 11644473600
local l_0_2 = MpCommon.GetCurrentTimeT()
if l_0_1 >= l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (l_0_2 - l_0_1) / 60
local l_0_5 = l_0_3 <= 10080
if l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
