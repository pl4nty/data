-- Threat: !InfrastructureShared
-- Name: 5878a53e26df
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
