-- Threat: !InfrastructureShared
-- Name: 3378ff1843fb
-- Type: 21

local l_0_0 = mp.getfilesize()
if 57000 < l_0_0 or l_0_0 < 15000 then
  return mp.CLEAN
end
return mp.INFECTED
