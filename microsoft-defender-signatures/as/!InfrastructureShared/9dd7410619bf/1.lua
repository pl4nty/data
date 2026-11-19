-- Threat: !InfrastructureShared
-- Name: 9dd7410619bf
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "echo%s+['\"]?([A-Za-z0-9/%+=]+)['\"]?")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = MpCommon.Base64Decode(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = l_0_3:lower()
if string.find(l_0_3, "https://", 1, true) or string.find(l_0_3, "http://", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
