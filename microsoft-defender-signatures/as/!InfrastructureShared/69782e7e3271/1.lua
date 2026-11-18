-- Threat: !InfrastructureShared
-- Name: 69782e7e3271
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
