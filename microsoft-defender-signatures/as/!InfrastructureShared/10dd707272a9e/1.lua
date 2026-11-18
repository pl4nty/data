-- Threat: !InfrastructureShared
-- Name: 10dd707272a9e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = {
  "privacy-script"
}
if contains(l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
