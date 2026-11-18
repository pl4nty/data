-- Threat: !InfrastructureShared
-- Name: 82d78af384f0
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3 = string.gsub(l_0_1, "%^", "")
if not l_0_3 then
  return mp.CLEAN
end
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
if not string.find(l_0_2, "rundll32", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_2, "pushd", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
