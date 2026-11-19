-- Threat: !InfrastructureShared
-- Name: b078873d8045
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 < 2500000 then
  return mp.INFECTED
end
return mp.CLEAN
