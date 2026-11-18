-- Threat: !InfrastructureShared
-- Name: 6c78cb44a0f9
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
