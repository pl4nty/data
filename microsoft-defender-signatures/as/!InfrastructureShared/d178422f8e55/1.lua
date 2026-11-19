-- Threat: !InfrastructureShared
-- Name: d178422f8e55
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
