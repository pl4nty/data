-- Threat: !InfrastructureShared
-- Name: 4d616b2ef2c4
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 622592 < l_0_0 and l_0_0 < 655360 then
  return mp.INFECTED
end
return mp.CLEAN
