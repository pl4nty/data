-- Threat: !InfrastructureShared
-- Name: 5ed72cb8de00
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 and string.find(string.lower(l_0_0.image_path), "cmd.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
