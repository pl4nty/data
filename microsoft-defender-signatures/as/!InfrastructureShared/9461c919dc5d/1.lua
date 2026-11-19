-- Threat: !InfrastructureShared
-- Name: 9461c919dc5d
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 1507328 <= l_0_0 and l_0_0 <= 1769472 then
  return mp.INFECTED
end
return mp.CLEAN
