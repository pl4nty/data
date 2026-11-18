-- Threat: !InfrastructureShared
-- Name: 8678a0178b49
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
