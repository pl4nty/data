-- Threat: !InfrastructureShared
-- Name: 5f78a303482e
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
