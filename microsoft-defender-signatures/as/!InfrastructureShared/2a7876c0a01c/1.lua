-- Threat: !InfrastructureShared
-- Name: 2a7876c0a01c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and (1000000 < l_0_0 and l_0_0 < 2000000 or 200000 < l_0_0 and l_0_0 < 500000) then
  return mp.INFECTED
end
return mp.CLEAN
