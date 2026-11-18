-- Threat: !InfrastructureShared
-- Name: d9619fea0e96
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 2000000 < l_0_0 and l_0_0 < 5500000 then
  return mp.INFECTED
end
return mp.CLEAN
