-- Threat: !InfrastructureShared
-- Name: 73d7a740f1e2
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(string.sub(l_0_0.image_path, -9))
if l_0_1 == "mshta.exe" then
  return mp.INFECTED
end
return mp.CLEAN
