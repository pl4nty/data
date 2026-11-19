-- Threat: !InfrastructureShared
-- Name: 56782023186c
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
