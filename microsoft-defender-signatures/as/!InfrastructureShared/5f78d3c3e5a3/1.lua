-- Threat: !InfrastructureShared
-- Name: 5f78d3c3e5a3
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
