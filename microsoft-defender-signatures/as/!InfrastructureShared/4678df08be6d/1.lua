-- Threat: !InfrastructureShared
-- Name: 4678df08be6d
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 1089536 <= l_0_0 and l_0_0 <= 1212416 then
  return mp.INFECTED
end
return mp.CLEAN
