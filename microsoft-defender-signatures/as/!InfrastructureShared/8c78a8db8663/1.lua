-- Threat: !InfrastructureShared
-- Name: 8c78a8db8663
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
