-- Threat: !InfrastructureShared
-- Name: 43b3d9eaf9b4
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0:lower()
if string.find(l_0_1, "\\mpcmdrun.exe", 1, true) or string.find(l_0_1, "\\mpsigstub.exe", 1, true) or string.find(l_0_1, "\\cyber-protect-service.exe", 1, true) or string.find(l_0_1, "\\mbamservice.exe", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
