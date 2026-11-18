-- Threat: !InfrastructureShared
-- Name: 8378a015e63a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
