-- Threat: !InfrastructureShared
-- Name: 33d7bee2896d
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 18 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "accepteula", 1, true) or string.match(l_0_1, "[%-/]m[acdkmp]") then
  return mp.INFECTED
end
return mp.CLEAN
