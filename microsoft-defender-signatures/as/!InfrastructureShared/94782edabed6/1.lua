-- Threat: !InfrastructureShared
-- Name: 94782edabed6
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
