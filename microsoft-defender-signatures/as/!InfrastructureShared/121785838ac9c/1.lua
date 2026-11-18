-- Threat: !InfrastructureShared
-- Name: 121785838ac9c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 720896 <= l_0_0 and l_0_0 <= 851968 then
  return mp.INFECTED
end
return mp.CLEAN
