-- Threat: !InfrastructureShared
-- Name: 7c788a7532e2
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
