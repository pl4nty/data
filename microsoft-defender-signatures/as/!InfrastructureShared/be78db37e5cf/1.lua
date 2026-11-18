-- Threat: !InfrastructureShared
-- Name: be78db37e5cf
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
