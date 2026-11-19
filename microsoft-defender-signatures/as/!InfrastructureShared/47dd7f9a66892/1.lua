-- Threat: !InfrastructureShared
-- Name: 47dd7f9a66892
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 and string.find(string.lower(l_0_0.image_path), "cmd.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
