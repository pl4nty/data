-- Threat: !InfrastructureShared
-- Name: 2378e1cbfa76
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
