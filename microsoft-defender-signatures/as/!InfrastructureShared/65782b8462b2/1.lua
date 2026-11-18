-- Threat: !InfrastructureShared
-- Name: 65782b8462b2
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
