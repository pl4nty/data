-- Threat: !InfrastructureShared
-- Name: e2d719d516d6
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 and string.find(string.lower(l_0_0.image_path), "python", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
