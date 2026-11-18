-- Threat: !InfrastructureShared
-- Name: 8378966afa62
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 500000 < l_0_0 and l_0_0 < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
