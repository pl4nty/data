-- Threat: !InfrastructureShared
-- Name: 8678c59d0146
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
