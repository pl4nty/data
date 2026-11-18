-- Threat: !InfrastructureShared
-- Name: 8e783e7958a3
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
