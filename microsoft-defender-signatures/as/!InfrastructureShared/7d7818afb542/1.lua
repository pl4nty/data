-- Threat: !InfrastructureShared
-- Name: 7d7818afb542
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
