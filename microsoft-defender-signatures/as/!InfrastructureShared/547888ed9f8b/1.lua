-- Threat: !InfrastructureShared
-- Name: 547888ed9f8b
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
