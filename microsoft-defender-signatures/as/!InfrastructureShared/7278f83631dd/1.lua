-- Threat: !InfrastructureShared
-- Name: 7278f83631dd
-- Type: 21

local l_0_0 = mp.getfilesize()
if 500000 < l_0_0 and l_0_0 < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
