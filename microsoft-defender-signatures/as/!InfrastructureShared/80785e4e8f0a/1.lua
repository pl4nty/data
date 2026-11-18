-- Threat: !InfrastructureShared
-- Name: 80785e4e8f0a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
