-- Threat: !InfrastructureShared
-- Name: c2786fa7683c
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
