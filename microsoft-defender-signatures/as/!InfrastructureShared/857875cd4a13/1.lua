-- Threat: !InfrastructureShared
-- Name: 857875cd4a13
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
