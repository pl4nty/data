-- Threat: !InfrastructureShared
-- Name: e078d0ee7f7c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and (2000000 < l_0_0 and l_0_0 < 5500000 or 8000000 < l_0_0 and l_0_0 < 11000000) then
  return mp.INFECTED
end
return mp.CLEAN
