-- Threat: !InfrastructureShared
-- Name: 70785ac61239
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 < 1500000 then
  return mp.INFECTED
end
return mp.CLEAN
