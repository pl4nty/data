-- Threat: !InfrastructureShared
-- Name: 397866095ab8
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
