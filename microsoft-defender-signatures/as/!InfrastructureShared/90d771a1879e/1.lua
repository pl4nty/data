-- Threat: !InfrastructureShared
-- Name: 90d771a1879e
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and string.find(l_0_0.image_path, "java", -4, true) then
  return mp.INFECTED
end
return mp.CLEAN
