-- Threat: !InfrastructureShared
-- Name: f778d8b9221d
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
