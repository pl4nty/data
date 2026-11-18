-- Threat: !InfrastructureShared
-- Name: 5b78b4eb8a78
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
