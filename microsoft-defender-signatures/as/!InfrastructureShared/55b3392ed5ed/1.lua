-- Threat: !InfrastructureShared
-- Name: 55b3392ed5ed
-- Type: 21

local l_0_0
l_0_0 = this_sigattrlog[4].utf8p2
l_0_0 = string.lower(l_0_0)
if l_0_0 == nil or string.find(l_0_0, ":\\windows\\", 2, true) or string.find(l_0_0, "^%%", 1) or string.find(l_0_0, ":\\programdata\\", 2, true) or string.find(l_0_0, "^:\\users\\.*\\appdata", 2, false) or string.find(l_0_0, ":\\program files (x86)\\", 2, true) or string.find(l_0_0, ":\\program files\\", 2, true) then
  return mp.CLEAN
end
local l_0_1 = sysio.GetFileLastWriteTime(l_0_0)
if sysio.GetLastResult().Success and l_0_1 ~= 0 then
  l_0_1 = l_0_1 / 10000000 - 11644473600
  local l_0_2 = MpCommon.GetCurrentTimeT()
  if l_0_1 > l_0_2 or 600 < l_0_2 - l_0_1 then
    return mp.CLEAN
  end
end
return mp.INFECTED
