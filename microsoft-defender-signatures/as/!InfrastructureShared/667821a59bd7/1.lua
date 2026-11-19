-- Threat: !InfrastructureShared
-- Name: 667821a59bd7
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
