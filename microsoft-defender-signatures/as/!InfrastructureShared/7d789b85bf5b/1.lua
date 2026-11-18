-- Threat: !InfrastructureShared
-- Name: 7d789b85bf5b
-- Type: 21

if peattributes.isexe == true or peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
