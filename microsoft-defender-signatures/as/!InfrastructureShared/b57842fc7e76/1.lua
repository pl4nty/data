-- Threat: !InfrastructureShared
-- Name: b57842fc7e76
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 309603 < l_0_0 and l_0_0 < 683198 then
  return mp.INFECTED
end
return mp.CLEAN
