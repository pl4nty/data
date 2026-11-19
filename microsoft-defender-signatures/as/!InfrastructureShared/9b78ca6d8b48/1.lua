-- Threat: !InfrastructureShared
-- Name: 9b78ca6d8b48
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
