-- Threat: !InfrastructureShared
-- Name: 81d7cdba21db
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
l_0_1 = l_0_1:gsub("%s+$", "")
if not l_0_1:match("cmd$") then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo(l_0_0.ppid)
if l_0_2 == nil or l_0_2 == "" or l_0_2.ppid == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2.ppid)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
l_0_3 = l_0_3:gsub("%s+$", "")
if l_0_3:match("/c cmd < *(%S+%.(%a+))%s*$") then
  return mp.INFECTED
end
return mp.CLEAN
