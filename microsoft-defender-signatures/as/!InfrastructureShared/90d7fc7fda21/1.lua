-- Threat: !InfrastructureShared
-- Name: 90d7fc7fda21
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
if string.find(l_0_2, "-raw%)['\"]?$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
