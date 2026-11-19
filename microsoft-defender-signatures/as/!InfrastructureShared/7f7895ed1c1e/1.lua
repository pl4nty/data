-- Threat: !InfrastructureShared
-- Name: 7f7895ed1c1e
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
