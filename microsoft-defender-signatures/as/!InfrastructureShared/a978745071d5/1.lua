-- Threat: !InfrastructureShared
-- Name: a978745071d5
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
