-- Threat: !InfrastructureShared
-- Name: 75d736689963
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 < 28 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "\\documents", 1, true) ~= nil then
  return mp.INFECTED
end
if string.find(l_0_1, "\\downloads", 1, true) ~= nil then
  return mp.INFECTED
end
if string.find(l_0_1, "\\desktop", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
