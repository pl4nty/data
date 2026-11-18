-- Threat: !InfrastructureShared
-- Name: 2b61be398ad7
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == false and l_0_0 < 196608 and 40960 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
