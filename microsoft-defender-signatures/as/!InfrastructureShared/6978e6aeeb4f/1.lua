-- Threat: !InfrastructureShared
-- Name: 6978e6aeeb4f
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
