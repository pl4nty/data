-- Threat: !InfrastructureShared
-- Name: 5678f4a7f4e8
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
