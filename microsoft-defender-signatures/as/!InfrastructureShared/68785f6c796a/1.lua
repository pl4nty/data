-- Threat: !InfrastructureShared
-- Name: 68785f6c796a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
