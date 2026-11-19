-- Threat: !InfrastructureShared
-- Name: 727840427eec
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
