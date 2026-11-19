-- Threat: !InfrastructureShared
-- Name: 63d7dba6bf3c
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
local l_0_2 = mp.GetProcessCommandLine(l_0_1)
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower()
if string.find(l_0_2, "wscript.exe", 1, true) and string.find(l_0_2, ".js", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
