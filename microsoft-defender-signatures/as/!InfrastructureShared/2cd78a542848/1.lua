-- Threat: !InfrastructureShared
-- Name: 2cd78a542848
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
local l_0_2 = mp.GetProcessCommandLine(l_0_0.ppid)
if not contains(l_0_1, {"node.exe"}) then
  return mp.CLEAN
end
if not contains(l_0_2, {".woff2"}) then
  return mp.CLEAN
end
return mp.INFECTED
