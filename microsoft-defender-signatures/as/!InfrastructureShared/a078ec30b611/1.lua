-- Threat: !InfrastructureShared
-- Name: a078ec30b611
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
