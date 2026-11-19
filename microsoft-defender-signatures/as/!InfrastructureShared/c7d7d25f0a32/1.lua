-- Threat: !InfrastructureShared
-- Name: c7d7d25f0a32
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
local l_0_1
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_2 = mp.GetProcessCommandLine(l_0_0)
if not l_0_2 then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
l_0_1 = string.gsub(l_0_2, "%^", "")
local l_0_3 = {"powershell"}
if not contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
return mp.INFECTED
