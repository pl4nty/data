-- Threat: !InfrastructureShared
-- Name: 113d790d87a72
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 and string.find(string.lower(l_0_0.image_path), "sbsimulation_sb_", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
