-- Threat: !InfrastructureShared
-- Name: b878b52610a8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
