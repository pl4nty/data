-- Threat: !InfrastructureShared
-- Name: 2778d5a3d022
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
