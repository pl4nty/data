-- Threat: !InfrastructureShared
-- Name: 7578e2064048
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 131072 <= l_0_0 and l_0_0 <= 196608 then
  return mp.INFECTED
end
return mp.CLEAN
