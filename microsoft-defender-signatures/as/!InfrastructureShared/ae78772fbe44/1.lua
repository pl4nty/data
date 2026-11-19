-- Threat: !InfrastructureShared
-- Name: ae78772fbe44
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 143360 <= l_0_0 and l_0_0 <= 155648 then
  return mp.INFECTED
end
return mp.CLEAN
