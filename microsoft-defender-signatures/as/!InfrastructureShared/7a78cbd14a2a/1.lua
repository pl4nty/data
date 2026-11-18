-- Threat: !InfrastructureShared
-- Name: 7a78cbd14a2a
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 <= 360448 and 356352 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
