-- Threat: !InfrastructureShared
-- Name: 9478985616df
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
