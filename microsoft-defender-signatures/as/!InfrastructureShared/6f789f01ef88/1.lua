-- Threat: !InfrastructureShared
-- Name: 6f789f01ef88
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
