-- Threat: !InfrastructureShared
-- Name: be78ebb62031
-- Type: 21

local l_0_0 = mp.getfilesize()
if 100000 < l_0_0 or l_0_0 < 10000 then
  return mp.CLEAN
end
return mp.INFECTED
