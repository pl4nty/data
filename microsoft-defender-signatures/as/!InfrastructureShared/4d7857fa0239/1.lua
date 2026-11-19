-- Threat: !InfrastructureShared
-- Name: 4d7857fa0239
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
