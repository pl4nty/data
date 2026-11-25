-- Threat: !InfrastructureShared
-- Name: c7d70f22e83e
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("'", "")
l_0_1 = l_0_1:gsub("\"", "")
l_0_1 = l_0_1:gsub("%s+", " ")
if string.find(l_0_1, "delims=", 1, true) and string.find(l_0_1, "for /", 1, true) and string.find(l_0_1, " do ", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
