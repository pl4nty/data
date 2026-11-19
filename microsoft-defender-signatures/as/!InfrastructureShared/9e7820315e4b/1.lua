-- Threat: !InfrastructureShared
-- Name: 9e7820315e4b
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
