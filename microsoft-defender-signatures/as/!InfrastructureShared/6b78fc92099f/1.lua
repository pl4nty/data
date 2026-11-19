-- Threat: !InfrastructureShared
-- Name: 6b78fc92099f
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and (315392 <= l_0_0 and l_0_0 <= 327680 or 405504 <= l_0_0 and l_0_0 <= 466944) then
  return mp.INFECTED
end
return mp.CLEAN
