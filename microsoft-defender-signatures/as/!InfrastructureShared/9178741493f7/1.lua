-- Threat: !InfrastructureShared
-- Name: 9178741493f7
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
