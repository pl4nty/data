-- Threat: !InfrastructureShared
-- Name: 6778f9c82484
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
