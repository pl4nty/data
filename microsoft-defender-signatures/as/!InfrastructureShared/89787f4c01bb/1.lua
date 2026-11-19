-- Threat: !InfrastructureShared
-- Name: 89787f4c01bb
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
