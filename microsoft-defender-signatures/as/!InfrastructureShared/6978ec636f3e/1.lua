-- Threat: !InfrastructureShared
-- Name: 6978ec636f3e
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
