-- Threat: !InfrastructureShared
-- Name: 3178ec6d6c1a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
