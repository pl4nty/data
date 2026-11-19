-- Threat: !InfrastructureShared
-- Name: 6dd7e90b5682
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil and string.find(string.lower(l_0_0.image_path), "w3wp.exe", -8, true) then
  return mp.INFECTED
end
return mp.CLEAN
