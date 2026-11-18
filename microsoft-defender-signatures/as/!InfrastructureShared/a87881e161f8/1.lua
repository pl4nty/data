-- Threat: !InfrastructureShared
-- Name: a87881e161f8
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
