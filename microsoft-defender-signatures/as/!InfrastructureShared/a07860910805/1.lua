-- Threat: !InfrastructureShared
-- Name: a07860910805
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
