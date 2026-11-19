-- Threat: !InfrastructureShared
-- Name: 2e786c074b50
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 3000000 < l_0_0 and l_0_0 < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
