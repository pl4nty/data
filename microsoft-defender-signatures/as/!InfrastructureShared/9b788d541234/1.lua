-- Threat: !InfrastructureShared
-- Name: 9b788d541234
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
