-- Threat: !InfrastructureShared
-- Name: 8c78f6ee061f
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
