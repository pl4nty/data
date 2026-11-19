-- Threat: !InfrastructureShared
-- Name: 6578a351d162
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
