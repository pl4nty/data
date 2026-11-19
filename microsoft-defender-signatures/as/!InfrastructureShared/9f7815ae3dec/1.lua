-- Threat: !InfrastructureShared
-- Name: 9f7815ae3dec
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
