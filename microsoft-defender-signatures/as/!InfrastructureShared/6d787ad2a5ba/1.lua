-- Threat: !InfrastructureShared
-- Name: 6d787ad2a5ba
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
