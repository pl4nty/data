-- Threat: !InfrastructureShared
-- Name: 8b78541c7e7a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
