-- Threat: !InfrastructureShared
-- Name: 67780f533d23
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
