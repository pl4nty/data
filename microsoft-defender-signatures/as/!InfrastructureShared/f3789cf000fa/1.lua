-- Threat: !InfrastructureShared
-- Name: f3789cf000fa
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
