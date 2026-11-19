-- Threat: !InfrastructureShared
-- Name: af78ba83209a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
