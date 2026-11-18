-- Threat: !InfrastructureShared
-- Name: 8478b998afb6
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
