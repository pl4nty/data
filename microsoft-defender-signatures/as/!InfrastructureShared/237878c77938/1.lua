-- Threat: !InfrastructureShared
-- Name: 237878c77938
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
