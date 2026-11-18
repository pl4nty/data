-- Threat: !InfrastructureShared
-- Name: 11d784923847e
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 512000 then
  return mp.INFECTED
end
return mp.CLEAN
