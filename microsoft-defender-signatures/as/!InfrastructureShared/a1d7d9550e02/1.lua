-- Threat: !InfrastructureShared
-- Name: a1d7d9550e02
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil and l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:find("\\explorer.exe") then
  return mp.INFECTED
end
return mp.CLEAN
