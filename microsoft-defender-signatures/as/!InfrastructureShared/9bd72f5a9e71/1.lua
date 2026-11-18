-- Threat: !InfrastructureShared
-- Name: 9bd72f5a9e71
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = 0
for l_0_3 in l_0_1:gmatch("'%w:\\'%s*;") do
  l_0_2 = l_0_2 + 1
end
if l_0_2 < 3 then
  return mp.CLEAN
end
if contains(l_0_1, "*.*") then
  return mp.INFECTED
end
return mp.CLEAN
