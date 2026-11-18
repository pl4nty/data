-- Threat: !InfrastructureShared
-- Name: 92783ecf2290
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
