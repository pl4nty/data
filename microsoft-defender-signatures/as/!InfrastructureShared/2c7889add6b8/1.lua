-- Threat: !InfrastructureShared
-- Name: 2c7889add6b8
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
