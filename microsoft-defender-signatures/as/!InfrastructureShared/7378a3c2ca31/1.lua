-- Threat: !InfrastructureShared
-- Name: 7378a3c2ca31
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
