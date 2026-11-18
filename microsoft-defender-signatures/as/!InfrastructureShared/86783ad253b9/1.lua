-- Threat: !InfrastructureShared
-- Name: 86783ad253b9
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
