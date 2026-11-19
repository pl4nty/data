-- Threat: !InfrastructureShared
-- Name: 39d787241114
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, ".zip\\", 1, true) == nil then
  return mp.CLEAN
end
if string.find(l_0_1, ".js", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
