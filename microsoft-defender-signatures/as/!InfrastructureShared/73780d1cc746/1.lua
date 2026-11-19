-- Threat: !InfrastructureShared
-- Name: 73780d1cc746
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
