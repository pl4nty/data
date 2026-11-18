-- Threat: !InfrastructureShared
-- Name: a278476549d0
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
