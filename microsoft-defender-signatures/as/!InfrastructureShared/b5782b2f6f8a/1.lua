-- Threat: !InfrastructureShared
-- Name: b5782b2f6f8a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
