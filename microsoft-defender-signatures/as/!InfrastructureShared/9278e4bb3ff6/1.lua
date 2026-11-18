-- Threat: !InfrastructureShared
-- Name: 9278e4bb3ff6
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
