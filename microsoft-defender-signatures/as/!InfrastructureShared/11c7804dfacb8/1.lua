-- Threat: !InfrastructureShared
-- Name: 11c7804dfacb8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 500000 < l_0_0 and l_0_0 < 700000 then
  return mp.INFECTED
end
return mp.CLEAN
