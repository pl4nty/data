-- Threat: !InfrastructureShared
-- Name: 5f78690885c1
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
