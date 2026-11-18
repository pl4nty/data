-- Threat: !InfrastructureShared
-- Name: 5a78a72eebe4
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 319000 < l_0_0 and l_0_0 < 319999 then
  return mp.INFECTED
end
return mp.CLEAN
