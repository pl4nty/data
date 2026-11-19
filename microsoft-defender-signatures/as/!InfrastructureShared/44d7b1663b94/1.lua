-- Threat: !InfrastructureShared
-- Name: 44d7b1663b94
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(string.sub(l_0_0.image_path, -14))
if l_0_1 == "rmmservice.exe" then
  return mp.INFECTED
end
return mp.CLEAN
