-- Threat: !InfrastructureShared
-- Name: 3bd78a4c7d43
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "--access-token", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
