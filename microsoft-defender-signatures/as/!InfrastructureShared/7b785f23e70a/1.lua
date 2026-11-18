-- Threat: !InfrastructureShared
-- Name: 7b785f23e70a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
