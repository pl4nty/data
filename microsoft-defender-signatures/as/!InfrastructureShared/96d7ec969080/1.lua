-- Threat: !InfrastructureShared
-- Name: 96d7ec969080
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 and string.find(string.lower(l_0_0.image_path), "python.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
