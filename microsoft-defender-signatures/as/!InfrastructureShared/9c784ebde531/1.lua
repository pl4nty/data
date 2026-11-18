-- Threat: !InfrastructureShared
-- Name: 9c784ebde531
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
