-- Threat: !InfrastructureShared
-- Name: 24761394b793a
-- Type: 21

local l_0_0 = mp.getfilesize()
if 2000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
return mp.INFECTED
