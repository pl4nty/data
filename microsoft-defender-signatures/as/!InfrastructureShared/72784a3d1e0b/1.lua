-- Threat: !InfrastructureShared
-- Name: 72784a3d1e0b
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
