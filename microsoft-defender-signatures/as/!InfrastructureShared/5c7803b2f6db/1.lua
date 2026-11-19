-- Threat: !InfrastructureShared
-- Name: 5c7803b2f6db
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
