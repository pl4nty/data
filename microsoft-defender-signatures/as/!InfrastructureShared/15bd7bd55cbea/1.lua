-- Threat: !InfrastructureShared
-- Name: 15bd7bd55cbea
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = "(?:\\\\windows\\\\temp\\\\|\\\\appdata\\\\roaming\\\\)([^\\\\\"']+)[\"'\\s]+https?:\\/\\/(?:.*)\\/([^$]+)$"
local l_0_3, l_0_4, l_0_5 = MpCommon.StringRegExpSearch(l_0_2, l_0_1)
if l_0_3 and l_0_4 == l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
