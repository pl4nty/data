-- Threat: !InfrastructureShared
-- Name: 447869f4d2f4
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
