-- Threat: !InfrastructureShared
-- Name: 6d780708e776
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
