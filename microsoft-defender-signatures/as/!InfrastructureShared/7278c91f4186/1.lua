-- Threat: !InfrastructureShared
-- Name: 7278c91f4186
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 149760 <= l_0_0 and l_0_0 <= 190208 then
  return mp.INFECTED
end
return mp.CLEAN
