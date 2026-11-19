-- Threat: !InfrastructureShared
-- Name: d861b528a6fe
-- Type: 21

local l_0_0 = mp.getfilesize()
if 458752 < l_0_0 and l_0_0 < 786432 then
  return mp.INFECTED
end
return mp.CLEAN
