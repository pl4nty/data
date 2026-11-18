-- Threat: !InfrastructureShared
-- Name: 5ed76f52faa1
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= "" and string.find(l_0_0.image_path, "postgres", -8, true) then
  return mp.INFECTED
end
return mp.CLEAN
