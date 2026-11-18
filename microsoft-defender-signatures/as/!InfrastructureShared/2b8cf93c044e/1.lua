-- Threat: !InfrastructureShared
-- Name: 2b8cf93c044e
-- Type: 21

local l_0_0 = mp.getfilesize()
if 600000 < l_0_0 or l_0_0 < 10000 then
  return mp.CLEAN
end
return mp.INFECTED
