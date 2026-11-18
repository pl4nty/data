-- Threat: !InfrastructureShared
-- Name: 89788ff6d0c3
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
