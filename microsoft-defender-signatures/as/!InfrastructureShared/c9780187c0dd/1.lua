-- Threat: !InfrastructureShared
-- Name: c9780187c0dd
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
