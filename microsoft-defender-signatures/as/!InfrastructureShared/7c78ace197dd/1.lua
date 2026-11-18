-- Threat: !InfrastructureShared
-- Name: 7c78ace197dd
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
