-- Threat: !InfrastructureShared
-- Name: 85785a97ccc4
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
