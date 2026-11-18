-- Threat: !InfrastructureShared
-- Name: 5078b88e26e2
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
