-- Threat: !InfrastructureShared
-- Name: 68785f27ab26
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
