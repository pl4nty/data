-- Threat: !InfrastructureShared
-- Name: 3c7821b2c6a7
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
