-- Threat: !InfrastructureShared
-- Name: 867827eb805c
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
