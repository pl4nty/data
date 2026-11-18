-- Threat: !InfrastructureShared
-- Name: 41b3cc563fcf
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == nil or string.find(l_0_0, ":\\windows\\", 2, true) or string.find(l_0_0, "^%%", 0) or string.find(l_0_0, ":\\programdata\\", 2, true) or string.find(l_0_0, "^:\\users\\.*\\appdata", 2, false) or string.find(l_0_0, ":\\program files (x86)\\", 2, true) or string.find(l_0_0, ":\\program files\\", 2, true) or mp.IsKnownFriendlyFile(l_0_0, true, false) then
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
