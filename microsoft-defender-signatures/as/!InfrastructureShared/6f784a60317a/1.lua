-- Threat: !InfrastructureShared
-- Name: 6f784a60317a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
