-- Threat: !InfrastructureShared
-- Name: d378c6e8ae21
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
