-- Threat: !InfrastructureShared
-- Name: 5878daab4cc5
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
