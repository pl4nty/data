-- Threat: !InfrastructureShared
-- Name: 57d7ec6ed571
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if not string.find(l_0_1, "\\explorer.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
