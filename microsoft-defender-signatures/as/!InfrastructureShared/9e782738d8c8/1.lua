-- Threat: !InfrastructureShared
-- Name: 9e782738d8c8
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
