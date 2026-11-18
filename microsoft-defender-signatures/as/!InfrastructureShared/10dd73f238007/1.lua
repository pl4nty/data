-- Threat: !InfrastructureShared
-- Name: 10dd73f238007
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if not contains(l_0_1, {
  "node.exe",
  "python.exe",
  "python3"
}) then
  return mp.CLEAN
end
return mp.INFECTED
