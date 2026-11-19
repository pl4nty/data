-- Threat: !InfrastructureShared
-- Name: 3178cf2b31cb
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 50000 or 300000 < l_0_0 and l_0_0 < 600000 then
  return mp.INFECTED
end
return mp.CLEAN
