-- Threat: !InfrastructureShared
-- Name: 557839ece59a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
