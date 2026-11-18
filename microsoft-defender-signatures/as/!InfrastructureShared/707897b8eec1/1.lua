-- Threat: !InfrastructureShared
-- Name: 707897b8eec1
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 <= 524288 and 327680 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
