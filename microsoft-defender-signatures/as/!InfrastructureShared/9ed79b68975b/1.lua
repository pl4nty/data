-- Threat: !InfrastructureShared
-- Name: 9ed79b68975b
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if string.find(l_0_1, "delims=", 1, true) and string.find(l_0_1, "for /", 1, true) and string.find(l_0_1, " do ", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
