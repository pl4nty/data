-- Threat: !InfrastructureShared
-- Name: c378f8f28530
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
