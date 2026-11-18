-- Threat: !InfrastructureShared
-- Name: 2e783ca14b6f
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 700000 < l_0_0 and l_0_0 < 1600000 then
  return mp.INFECTED
end
return mp.CLEAN
