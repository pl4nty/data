-- Threat: !InfrastructureShared
-- Name: 65786a95e984
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
