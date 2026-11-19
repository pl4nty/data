-- Threat: !InfrastructureShared
-- Name: f27817d7ff8a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
