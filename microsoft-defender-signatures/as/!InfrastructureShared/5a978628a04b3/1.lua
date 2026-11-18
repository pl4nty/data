-- Threat: !InfrastructureShared
-- Name: 5a978628a04b3
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 3600000 then
  return mp.INFECTED
end
return mp.CLEAN
