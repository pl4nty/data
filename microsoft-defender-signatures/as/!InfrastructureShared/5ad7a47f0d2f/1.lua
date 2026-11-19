-- Threat: !InfrastructureShared
-- Name: 5ad7a47f0d2f
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
if not contains(l_0_2, {
  "fa-solid-900.woff2"
}) then
  return mp.CLEAN
end
return mp.INFECTED
