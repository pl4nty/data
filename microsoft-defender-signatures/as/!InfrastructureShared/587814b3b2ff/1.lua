-- Threat: !InfrastructureShared
-- Name: 587814b3b2ff
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
