-- Threat: !InfrastructureShared
-- Name: 4dd7e7da1a7a
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
  "%:\\windows\\.*%.bat"
}
if contains(l_0_1, l_0_2, false) then
  return mp.INFECTED
end
return mp.CLEAN
