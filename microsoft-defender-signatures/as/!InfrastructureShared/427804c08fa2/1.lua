-- Threat: !InfrastructureShared
-- Name: 427804c08fa2
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
