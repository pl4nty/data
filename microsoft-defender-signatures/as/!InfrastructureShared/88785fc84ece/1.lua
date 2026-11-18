-- Threat: !InfrastructureShared
-- Name: 88785fc84ece
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
