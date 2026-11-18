-- Threat: !InfrastructureShared
-- Name: 8578b30af7d2
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
