-- Threat: !InfrastructureShared
-- Name: 8578c764a872
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 <= 1101824 and 1081344 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
