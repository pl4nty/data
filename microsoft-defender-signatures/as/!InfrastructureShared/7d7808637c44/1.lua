-- Threat: !InfrastructureShared
-- Name: 7d7808637c44
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
