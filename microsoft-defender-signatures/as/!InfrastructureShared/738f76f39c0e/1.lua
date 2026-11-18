-- Threat: !InfrastructureShared
-- Name: 738f76f39c0e
-- Type: 21

local l_0_0 = mp.getfilesize()
if 174080 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
