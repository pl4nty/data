-- Threat: !InfrastructureShared
-- Name: 10778310542b5
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
