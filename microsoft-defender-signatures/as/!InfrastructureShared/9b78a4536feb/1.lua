-- Threat: !InfrastructureShared
-- Name: 9b78a4536feb
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
