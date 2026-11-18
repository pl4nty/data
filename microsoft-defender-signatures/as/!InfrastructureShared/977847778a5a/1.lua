-- Threat: !InfrastructureShared
-- Name: 977847778a5a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
