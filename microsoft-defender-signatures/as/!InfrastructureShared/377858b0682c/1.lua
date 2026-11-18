-- Threat: !InfrastructureShared
-- Name: 377858b0682c
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
